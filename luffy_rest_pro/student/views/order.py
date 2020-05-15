#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import serializers
from django.utils.timezone import now
# 本地库
from utils.base_response import BaseResponse
from rbac.models import UserInfo
from ..models import OrderDetail, Order,StudyCourse
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        order_detail_info = serializers.SerializerMethodField(read_only=True)
        status = serializers.CharField(source='get_status_display', read_only=True)

        def get_order_detail_info(self, obj):
            qs = obj.orderdetail_set.all()
            return [{
                'title': order_detail.content_object.title,
                'original_price': order_detail.original_price,
                'price': order_detail.price,
                'valid_period_display': order_detail.valid_period_display,
            } for order_detail in qs]

        class Meta:
            model = model_class
            fields = [
                'id',
                'order_number',
                'actual_amount',
                'status',
                'date',
                'pay_time',
                'cancel_time',
                'order_detail_info',
            ]

    return ModelSerializer


class OrderView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.payment_type = None
        self.actual_amount = None
        self.user = None
        self.payment_number = None
        self.status = None
        self.actual_amount = None
        self.order_id = None
        self.order_qs = None


    def get(self, request):
        # user_id = 1  # 先写死
        # user = UserInfo.objects.filter(pk=1).first()
        # 获取qs对象
        self.user = request.user
        order = Order.objects.filter(account=self.user)
        ser = get_serializer(Order)(order, many=True)
        return Response(ser.data)

    def put(self, request):
        res = BaseResponse()
        try:
            # 负责处理第三方订单
            # 获取数据
            self.get_data(request)
            # 校验数据合法性
            self.check_data()
            #  校验成功,修改订单状态
            self.update_order()
            # 添加用户课程购买的记录
            self.update_study_course()

            res.data='订单付款成功'

            return Response(res.dic)
        except KeyError as e:
            print(e)
            res.code = 1040
            res.errors = '订单参数不合法'
            return Response(res.dic)
        except Exception as e:
            print(e)
            res.code = 1045
            res.errors = '订单未知错误'
            return Response(res.dic)


    def get_data(self, request):

        self.status = request.data.get('status')
        self.payment_number = request.data.get('payment_number')
        self.actual_amount = request.data.get('actual_amount')
        self.order_id = request.data.get('order_id')
        # user = UserInfo.objects.filter(pk=1).first()  # 先写死
        self.user = request.user
        # self.user = user
        if not self.payment_number or not self.actual_amount or not self.order_id:
            raise KeyError("请求参数不合法")


    def check_data(self):
        if int(self.status):
            raise KeyError("状态参数不合法")
        self.order_qs = Order.objects.filter(pk=self.order_id,account=self.user,status=1) #必须是未支付的才能修改为已支付
        if not self.order_qs :
            raise KeyError('订单参数不合法')

    def update_order(self):
        self.order_qs.update(payment_number=self.payment_number,status =self.status,pay_time=now())

    def update_study_course(self):
        qs = OrderDetail.objects.filter(order__pk=self.order_id).values('object_id')
        print(qs,111111111)
        for dic in qs:
            print(dic['object_id'],22222222)
            StudyCourse.objects.create(account=self.user,course_id=dic['object_id'])
