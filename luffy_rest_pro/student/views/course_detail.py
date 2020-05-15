#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from student.models import CourseDetail
from rbac.models import UserInfo

view_class = get_base_modelviewset(CourseDetail)

def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        course = serializers.SerializerMethodField(read_only=True)

        def get_course(self, obj):
            course_obj = obj.course
            pp_qs = obj.course.price_policy.all().order_by('price')
            pp_list = [{"id": obj.id, "price": obj.price, 'valid_period': obj.get_valid_period_display()} for obj in pp_qs]
            return dict(id=course_obj.id,study_num=course_obj.study_num,title=course_obj.title,price_policy=pp_list)

        class Meta:
            model = model_class
            fields = [
                'id',
                'course',
                'hours',
                'video_brief_link',
                'summary',
                'course',
            ]

    return ModelSerializer

class CourseDetailView(view_class):
    serializer_class=get_serializer(CourseDetail)

