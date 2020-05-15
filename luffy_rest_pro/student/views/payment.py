#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
import json
import datetime
import redis
import uuid
# 第三方模块
from rest_framework.views import APIView
from rest_framework.response import Response
from django.utils.timezone import now
from django.db.models import F
from django.conf import settings
# 本地库
from web import models
from .. import models as smodels
# from account.utils.authentication import Authentication
from utils.base_response import BaseResponse
from utils.redis_pool import pool
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

CONN = redis.Redis(connection_pool=pool)
# SHOPPING_CAR = settings.SHOPPING_CAR
SETTLEMENT = settings.SETTLEMENT
GLOBAL_COUPON = settings.GLOBAL_COUPON


class PaymentView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.user_id = None
        self.balance = 0
        self.total_price = None
        self.user = None
        self.global_coupon = None
        self.price = 0
        self.course = []

    def post(self, request):
        res = BaseResponse()
        try:
            # 接受request数据

            self.get_data(request)

            # 校验数据+计算价格
            self.check_data()

            # 校验计算价格和发过来的价格是否一致,保留两位小数
            if '%.2f' % self.price != '%.2f' % float(self.total_price):
                raise KeyError

            # 创建订单,更新优惠卷状态,为已经使用,
            order_id = self.create_order()
            res.data = {'order_id': order_id}
            return Response(res.dic)
        except ValueError as e:
            print(e)
            res.code = 1080
            res.errors = '结算数据已经过期'
            return Response(res.dic)
        except KeyError as e:
            print(e)
            res.code = 1081
            res.errors = '参数不合法'
            return Response(res.dic)
        except IndexError as e:
            print(e)
            res.code = 1082
            res.errors = '优惠卷不合法'
            return Response(res.dic)
        except Exception as e:
            print(e)
            res.code = 1083
            res.errors = '未知错误'
            return Response(res.dic)
        # 构建数据
        # 传入redis

    def get_data(self, request):
        self.balance = request.data.get('balance', 0)
        self.total_price = request.data.get('total_price')
        # user = UserInfo.objects.filter(pk=1).first()  # 先写死
        self.user = request.user
        # self.user = user
        if self.total_price is None:
            raise KeyError("请求参数不合法")

    def check_data(self):
        # 检验贝里

        if float(self.balance) > float(self.user.balance):
            raise KeyError
        # 校验结算中心数据

        settlement_list, default_global_coupon_id = self.get_settlement()
        # 2 去校验数据
        self.check_settlement(settlement_list, default_global_coupon_id)

    def get_settlement(self):
        self.user_id = self.user.pk
        settlement_key = SETTLEMENT % (self.user_id, "*")
        global_coupon_key = GLOBAL_COUPON % self.user_id
        all_name = CONN.scan_iter(settlement_key)
        if not all_name:
            raise ValueError('结算中心数据不存在')
        ret = []
        for name in all_name:
            ret.append(CONN.hgetall(name))
        default_global_coupon_id = CONN.hget(global_coupon_key, "default_global_coupon_id")
        return ret, default_global_coupon_id

    def check_settlement(self, settlement_list, default_global_coupon_id):

        # 先校验课程优惠卷+计算
        for settlement in settlement_list:
            default_coupon_id = settlement.get('default_coupon_id')  # 这个是coupon的id
            course_id = settlement.get('course_id')
            valid_period = settlement.get('valid_period')
            valid_period_display = settlement.get('valid_period_display')
            # 需要检测课程是否下线了
            if not smodels.Course.objects.filter(pk=course_id, status=0).exists():
                raise ValueError('课程已经下线')
            course_price = float(settlement.get('price'))
            if default_coupon_id:
                course_coupon = self.is_overdue(default_coupon_id, course_id=course_id)
                price = self.calculate_price(course_coupon[0], course_price)
            else:
                price = self.calculate_price(course_price=course_price)
            self.course.append({
                'course_id': course_id,
                'original_price': course_price,
                'price': float(price),
                'valid_period': valid_period,
                'valid_period_display': valid_period_display,
                'coupon_id': default_coupon_id

            })

            # self.calculate_price(course_coupon, course_coupon_price)

        # 再校验全局优惠卷+计算
        if default_global_coupon_id:
            global_coupon_qs = self.is_overdue(default_global_coupon_id)
            self.global_coupon = default_global_coupon_id

        # 贝里计算
        if self.balance:
            self.price -= self.balance
            if self.price < 0:
                raise ValueError("贝里不合法")

    def is_overdue(self, coupon_id, course_id=None):
        '''
        查询优惠卷有效性
        :param record_id:优惠卷记录id
        :return:
        '''
        # 领取后在+n天的时间要大于现在的时间,需不需要比对换算规则
        if not course_id:
            global_coupon = smodels.Coupon.objects.filter(
                couponrecord__account=self.user,
                pk=coupon_id,
                couponrecord__status=0,
                valid_begin_date__lte=now(),
                valid_end_date__gte=now(),
            ).values("coupon_type", "money_equivalent_value", "off_percent", "minimum_consume")
            if not global_coupon:
                raise IndexError("课程优惠卷不合法")
            return global_coupon
        else:
            course_coupon = smodels.Coupon.objects.filter(
                couponrecord__account=self.user,
                pk=coupon_id,
                couponrecord__status=0,
                valid_begin_date__lte=now(),
                valid_end_date__gte=now(),
                # content_object__status=0,
                object_id=course_id,
            ).values("coupon_type", "money_equivalent_value", "off_percent", "minimum_consume")

            if not course_coupon:
                raise IndexError("全局优惠卷不合法")
            return course_coupon

    def calculate_price(self, coupon=None, course_price=None):
        if not coupon and course_price:
            self.price += course_price
            return course_price
        if course_price:
            price = float(course_price)
        else:
            price = self.price
        coupon_type = int(coupon.get('coupon_type'))
        money_equivalent_value = coupon.get('money_equivalent_value')  # 0
        off_percent = float(coupon['off_percent'])  # 100
        minimum_consume = float(coupon['minimum_consume'])  # 0
        if coupon_type == 0:
            price -= money_equivalent_value

        if coupon_type == 1:
            if price >= minimum_consume:
                price -= money_equivalent_value
            else:
                raise ValueError("优惠卷不合法")
        if coupon_type == 2:
            if price >= minimum_consume:
                off_percent_discount = price * ((100 - off_percent) / 100)
                price -= off_percent_discount
            else:
                raise ValueError("优惠卷不合法")
        if price < 0:
            raise ValueError("优惠卷不合法")
        if course_price:
            self.price += price
            return price
        else:
            discount = self.price - price
            self.price = price
            return discount

    def create_order(self):
        # 创建订单
        if self.price == 0:
            if self.balance:
                payment_type = 3
                smodels.TransactionRecord.objects.create(account=self.user,
                                                         amount=self.balance,
                                                         balance=self.user.balance - self.balance,
                                                         transaction_type=1,
                                                         transaction_number=str(uuid.uuid4()),
                                                         )
                UserInfo.objects.filter(pk=self.user_id).update(balance=self.user.balance - self.balance)
            else:
                payment_type = 2
            status = 0
        else:
            payment_type = 0
            status = 1

        obj = smodels.Order.objects.create(payment_type=payment_type, status=status, actual_amount=self.price,
                                           account=self.user,
                                           pay_time=now() if status == 0 else None,
                                           order_number=str(uuid.uuid4()))
        pipe = CONN.pipeline(transaction=True)
        pipe.multi()
        for dic in self.course:
            content_type = smodels.ContentType.objects.filter(model='course').first()
            # 不管有没有折扣都要算
            smodels.OrderDetail.objects.create(
                order=obj,
                content_type=content_type,
                object_id=dic['course_id'],
                original_price=dic['original_price'],
                price=dic['price'],
                valid_period=dic['valid_period'],
                valid_period_display=dic['valid_period_display'],
            )
            coupon_id = dic.get('coupon_id')
            if coupon_id:
                self.update_coupon_status(coupon_id)
            if status == 0:
                # 创建购买课程的记录
                smodels.StudyCourse.objects.create(account=self.user, course_id=dic['course_id'])
            settlement_key = SETTLEMENT % (self.user_id, dic['course_id'])
            pipe.delete(settlement_key)
        if self.global_coupon:
            self.update_coupon_status(self.global_coupon)
        pipe.execute()
        return obj.id

    @staticmethod
    def update_coupon_status(coupon_id):
        smodels.CouponRecord.objects.filter(pk=coupon_id).update(status=1, used_time=now())
