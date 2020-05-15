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
from teacher.models import StudentRecord
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(Article)

def get_serializer(model_class):


    class ModelSerializer(serializers.ModelSerializer):
        student_record_info = serializers.SerializerMethodField(read_only=True)


        def get_student_record_info(self,obj):
            qs = StudentRecord.objects.filter(teacher=obj)
            return [{
                'id':sr.id,
                'note':sr.note,
                'date':sr.date,
                'student':sr.student.username,
            }for sr in qs]

        class Meta:
            model = model_class
            fields =['id','username','student_record_info']

    return ModelSerializer


class TeacherRecordView(view_class):
    serializer_class=get_serializer(UserInfo)
    queryset = UserInfo.objects.filter(roles__in=[2])
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

