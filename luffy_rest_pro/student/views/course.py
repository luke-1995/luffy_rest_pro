#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from student.models import Course
from rbac.models import UserInfo

view_class = get_base_modelviewset(Course)


def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        price_policy = serializers.SerializerMethodField(read_only=True)
        course_detail_id=serializers.IntegerField(source='coursedetail.pk',read_only=True)

        def get_price_policy(self, obj):
            qs = obj.price_policy.all().order_by('price')
            return [{"id": obj.id, "price": obj.price, 'valid_period': obj.get_valid_period_display()} for obj in qs]

        class Meta:
            model = model_class
            fields = [
                'id',
                'title',
                'course_img',
                'brief',
                'study_num',
                'category',
                'price_policy',
                'course_detail_id',
            ]

    return ModelSerializer


class CourseView(view_class):
    serializer_class = get_serializer(Course)
    queryset = Course.objects.filter(status=0).order_by('order')


