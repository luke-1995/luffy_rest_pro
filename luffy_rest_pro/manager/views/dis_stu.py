#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from ..models import Article
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(Article)

def get_serializer(model_class):


    class ModelSerializer(serializers.ModelSerializer):
        teacher_info = serializers.SerializerMethodField(read_only=True)
        teacher_name=serializers.CharField(source='teacher.username',read_only=True)

        def get_teacher_info(self,obj):
            qs = UserInfo.objects.filter(roles__in=[2])
            return [{
                'id':teacher.id,
                'username':teacher.username,
            }for teacher in qs]

        class Meta:
            model = model_class
            fields =['id','username','teacher','teacher_name','teacher_info']

    return ModelSerializer


class DistributionStudentView(view_class):
    serializer_class=get_serializer(UserInfo)
    queryset = UserInfo.objects.filter(roles__in=[3])
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

