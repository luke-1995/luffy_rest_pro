#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from ..models import StudentRecord
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(StudentRecord)


class BaseSerializer(serializers.ModelSerializer):
    student_name = serializers.CharField(read_only=True,source='student.username')

    class Meta:
        model = StudentRecord
        fields = ['id','note','teacher','student','student_name','date']



class StudentRecordView(view_class):
    serializer_class=BaseSerializer
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]


    def list(self,request,pk):
        teacher = request.user
        qs = StudentRecord.objects.filter(student__pk=pk,teacher=teacher)
        ser = self.serializer_class(qs,many=True)
        return Response(ser.data)
