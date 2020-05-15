#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
import json

import redis
# 本地库
from django.conf import settings
from django.utils.timezone import now
from rest_framework.response import Response
from django.db.models import F
# 第三方模块
from rest_framework.views import APIView
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission
from utils.base_response import BaseResponse
from utils.redis_pool import pool
from .. import models as smodels


CONN = redis.Redis(connection_pool=pool)

SHOPPING_CAR = settings.SHOPPING_CAR
SETTLEMENT = settings.SETTLEMENT
GLOBAL_COUPON = settings.GLOBAL_COUPON


class SettlementView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def post(self, request):
        user_id = request.user.id
        course_list = request.data.get('course_list', '')
        res = BaseResponse()
        dic = {}
        global_coupon_dic = {}
        if not course_list:
            res.code = 1031
            res.errors = '结算中心请求参数不合法'
            return Response(res.dic)
        pipe = CONN.pipeline(transaction=True)
        pipe.multi()
        for course_id in course_list:
            name = SHOPPING_CAR % (str(user_id), str(course_id))
            if not CONN.exists(name):
                res.code = 1030
                res.errors = '结算中心课程id不合法'
                return Response(res.dic)
            shop_cart = CONN.hgetall(name)
            price_policy_dic = shop_cart.get('price_policy_dic')
            price_policy_dic = json.loads(price_policy_dic, encoding='utf-8')
            shop_cart['price'] = price_policy_dic[shop_cart['price_policy_default_id']]['price']
            shop_cart['valid_period'] = price_policy_dic[shop_cart['price_policy_default_id']][
                'valid_period']
            shop_cart['valid_period_display'] = price_policy_dic[shop_cart['price_policy_default_id']][
                'valid_period_display']
            shop_cart.pop('price_policy_dic')
            coupon_records = smodels.CouponRecord.objects.filter(
                account__pk=user_id,
                coupon__valid_begin_date__lte=now(),
                coupon__valid_end_date__gte=now(),
                status=0,
            ).all()
            course_coupon_dic = {}
            for record in coupon_records:
                coupon = record.coupon
                if coupon.object_id:
                    course_coupon_dic[coupon.id] = {
                        'id': coupon.id,
                        'name': coupon.name,
                        'coupon_type': coupon.get_coupon_type_display(),
                        'money_equivalent_value': coupon.money_equivalent_value,
                        'off_percent': coupon.off_percent,
                        'minimum_consume': coupon.minimum_consume,
                    }
                else:
                    global_coupon_dic[coupon.id] = json.dumps({
                        'id': coupon.id,
                        'name': coupon.name,
                        'coupon_type': coupon.get_coupon_type_display(),
                        'money_equivalent_value': coupon.money_equivalent_value,
                        'off_percent': coupon.off_percent,
                        'minimum_consume': coupon.minimum_consume,
                    }, ensure_ascii=False)
            if course_coupon_dic:
                shop_cart['course_coupon_dic'] = json.dumps(course_coupon_dic, ensure_ascii=False)

            settlement_key = SETTLEMENT % (str(user_id), str(course_id))
            pipe.hmset(settlement_key, shop_cart)
            pipe.delete(name)  # 删除购物车数据,在name的for循环中删掉
        if global_coupon_dic:
            global_coupon_key = GLOBAL_COUPON % str(user_id)
            pipe.hmset(global_coupon_key, global_coupon_dic)
        length = len(course_list)
        UserInfo.objects.filter(pk=user_id).update(shop_cart_num=F('shop_cart_num')-length)
        pipe.execute()
        res.data = '加入结算中心成功'
        return Response(res.dic)

    def get(self, request):
        user_id = request.user.id
        res = BaseResponse()

        settlement_key = SETTLEMENT % (str(user_id), '*')
        global_coupon_key = GLOBAL_COUPON % str(user_id)
        settlement_names = CONN.scan_iter(settlement_key)
        all_ret = []
        ret = []
        for name in settlement_names:

            dic = CONN.hgetall(name)
            if hasattr(dic, 'course_coupon_dic'):
                dic['course_coupon_dic'] = json.loads(dic['course_coupon_dic'], encoding='utf8')
            ret.append(dic)

        all_ret.append(ret)
        global_dic = CONN.hgetall(global_coupon_key)
        for key, value in global_dic.items():
            if key != 'default_global_coupon_id':
                global_dic[key] = json.loads(value, encoding='utf8')
        all_ret.append(global_dic)
        res.data = all_ret
        return Response(res.dic)

    def put(self, request):
        user_id = request.user.id
        coupon_id = request.data.get('coupon_id')
        global_coupon_id = request.data.get('global_coupon_id')
        course_id = request.data.get('course_id')
        res = BaseResponse()
        pipe = CONN.pipeline(transaction=True)
        pipe.multi()
        if global_coupon_id is None and coupon_id is None or not course_id:
            res.code = 1031
            res.errors = '结算中心请求参数不合法'
            return Response(res.dic)
        if global_coupon_id or str(global_coupon_id) == "0":
            global_coupon_key = GLOBAL_COUPON % str(user_id)
            if not CONN.exists(global_coupon_key):
                res.code = 1032
                res.errors = '全局优惠卷不存在'
                return Response(res.dic)
            if int(global_coupon_id) == 0:
                pipe.hdel(global_coupon_key, "default_global_coupon_id")
            else:
                global_coupon = CONN.hgetall(global_coupon_key)
                if str(global_coupon_id) not in global_coupon:
                    res.code = 1033
                    res.errors = '全局优惠卷不合法'
                    return Response(res.dic)
                else:
                    global_coupon['default_global_coupon_id'] = global_coupon_id
                pipe.hmset(global_coupon_key, global_coupon)
            pipe.execute()
            res.data = '全局优惠卷更新成功'
            return Response(res.dic)
        if coupon_id or str(coupon_id) == "0":

            settlement_key = SETTLEMENT % (str(user_id), str(course_id))
            if not CONN.exists(settlement_key):
                res.code = 1030
                res.errors = '课程id不合法'
                return Response(res.dic)
            if int(coupon_id) == 0:
                pipe.hdel(settlement_key, 'default_coupon_id')
            else:
                settlement = CONN.hgetall(settlement_key)
                course_coupon_dic = settlement.get('course_coupon_dic')
                if course_coupon_dic is None:
                    # 优惠卷信息不存在,请求参数不合法
                    res.code = 1031
                    res.errors = '结算中心请求参数不合法'
                    return Response(res.dic)
                course_coupon_dic = json.loads(course_coupon_dic, encoding='utf-8')
                if str(coupon_id) not in course_coupon_dic:
                    res.code = 1035
                    res.errors = '课程优惠卷不合法'
                    return Response(res.dic)
                else:
                    settlement['default_coupon_id'] = coupon_id
                pipe.hmset(settlement_key, settlement)
            pipe.execute()
            res.data = '课程优惠卷更新成功'
            return Response(res.dic)
