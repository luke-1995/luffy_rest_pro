#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
# from ..models import StudentRecord
from rbac.models import UserInfo
from rbac.serializers.rbac import UserinfoSerializer
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(UserInfo)



class StudentListView(view_class):
    serializer_class=UserinfoSerializer
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]


    def list(self,request):
        teacher = request.user
        queryset = UserInfo.objects.filter(teacher=teacher)
        ser = self.serializer_class(queryset,many=True)
        return Response(ser.data)
