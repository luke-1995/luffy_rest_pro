#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
import json
# 第三方模块
from rest_framework.response import Response
from rest_framework.views import APIView

# 本地库
from django.conf import settings
from django.db.models import F
from rbac.models import UserInfo
from ..models import Course,StudyCourse
from utils.base_response import BaseResponse
from utils.redis_pool import *
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


SHOPPING_CAR = settings.SHOPPING_CAR

CONN = redis.Redis(connection_pool=pool)


class ShoppingCartView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def post(self, request):
        ret = BaseResponse()
        user = request.user
        user_id = user.id
        course_id = request.data.get('course_id', '')
        price_policy_id = request.data.get('price_policy_id', '')
        if not course_id or not price_policy_id:
            ret.code = 1020
            ret.errors = '购物车请求参数不合法'
            return Response(ret.dic)
        course = Course.objects.filter(pk=course_id).first()
        if not course:
            ret.code = 1025
            ret.errors = '购物车课程id不合法'
            return Response(ret.dic)
        if StudyCourse.objects.filter(account=user,course=course).exists():
            ret.code = 1024
            ret.errors = '课程已购买,请勿重复加入购物车'
            return Response(ret.dic)
        price_policy_qs = course.price_policy.all()
        price_policy_dic = {}
        for obj in price_policy_qs:
            price_policy_dic[obj.id] = dict(id=obj.id, price=obj.price,
                                            valid_period_display=obj.get_valid_period_display(),
                                            valid_period=obj.valid_period)
        if price_policy_id not in price_policy_dic:
            ret.code = 1021
            ret.errors = '购物车价格策略id不合法'
            return Response(ret.dic)


        price_policy_dic = json.dumps(price_policy_dic, ensure_ascii=False)
        key = SHOPPING_CAR % (user_id, course_id)
        value = dict(course_id=course_id, title=course.title, course_img=str(course.course_img),
                     price_policy_dic=price_policy_dic, price_policy_default_id=price_policy_id)
        try:
            if not CONN.exists(key):
                UserInfo.objects.filter(pk=user_id).update(shop_cart_num=F('shop_cart_num')+1)
            CONN.hmset(key, value)
            ret.data = '加入购物车成功'
            return Response(ret.dic)
        except Exception as e:
            ret.code = 1022
            ret.errors = '加入购物车失败'
            return Response(ret.dic)

    def get(self, request):
        user = request.user
        user_id = user.id
        # user_id = 1  # 写死了
        res = BaseResponse()
        name = SHOPPING_CAR % (user_id, '*')
        all_name = CONN.scan_iter(name)
        ret = []
        for name in all_name:
            dic = CONN.hgetall(name)
            dic['price_policy_dic'] = json.loads(dic['price_policy_dic'], encoding='utf8')
            # dic['price_policy_dic'] = [value for key,value in dic['price_policy_dic'].item() ]
            ret.append(dic)
        res.data = ret
        return Response(res.dic)

    def put(self, request):
        user = request.user
        user_id = user.id
        # user_id = 1  # 写死了
        course_id = request.data.get('course_id', '')
        price_policy_id = request.data.get('price_policy_id', '')
        res = BaseResponse()
        name = SHOPPING_CAR % (user_id, course_id)
        if not course_id or not price_policy_id:
            res.code = 1020
            res.errors = '购物车请求参数不合法'
            return Response(res.dic)
        if not CONN.exists(name):
            res.code = 1025
            res.errors = '购物车课程id不合法'
            return Response(res.dic)
        course_info = CONN.hgetall(name)
        price_policy_dic = course_info.get('price_policy_dic')
        price_policy_dic = json.loads(price_policy_dic, encoding='utf-8')
        if str(price_policy_id) not in price_policy_dic:
            res.code = 1021
            res.errors = '价格策略id不合法'
            return Response(res.dic)
        course_info['price_policy_default_id'] = price_policy_id
        try:
            CONN.hmset(name, course_info)
            res.data = '更新购物车成功'
            return Response(res.dic)
        except Exception as e:
            res.code = 1022
            res.errors = '加入购物车失败'
            return Response(res.dic)

    def delete(self, request):
        res = BaseResponse()
        try:
            user = request.user
            user_id = user.id
            # user_id = 1  # 写死了
            course_list = request.data.get('course_list', '')
            pipe = CONN.pipeline(transaction=True)
            pipe.multi()
            if not course_list:
                res.code = 1020
                res.errors = '购物车请求参数不合法'
                return Response(res.dic)
            for course_id in course_list:
                print(type(course_id), course_id)
                name = SHOPPING_CAR % (user_id, str(course_id))
                if not CONN.exists(name):
                    res.code = 1025
                    res.errors = '购物车课程id不合法'
                    return Response(res.dic)
                pipe.delete(name)
            pipe.execute()
            if course_list:
                UserInfo.objects.filter(pk=user_id).update(shop_cart_num=F('shop_cart_num') - 1)
            return Response(res.dic)
        except Exception as e:
            print(e)
            res.code = 1022
            res.errors = '删除购物车失败'
            return Response(res.dic)
