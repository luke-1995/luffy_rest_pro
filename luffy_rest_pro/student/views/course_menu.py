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
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(Course)


def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        category_info = serializers.SerializerMethodField(read_only=True)

        def get_category_info(self,obj):
            qs = obj.category.all()
            return [{
                'id':category.id,
                'title':category.title,
            }for category in qs]


        class Meta:
            model = model_class
            fields = '__all__'

    return ModelSerializer

class CourseViewSet(view_class):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

