#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
# 本地库

from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response

# 本地库
from .. import models
from ..serializers.rbac import MenuSerializer,SecondMenuSerializer,PermissionMenuSerializer

class MenuModelViewSet(ModelViewSet):
    queryset = models.FirstMenu.objects.all().order_by("pk")
    serializer_class = MenuSerializer

    # def retrieve(self,request,pk):
    #     role=models.FirstMenu.objects.filter(pk=pk).first()
    #     ser = MenuChangeSerializer(role)
    #     return Response(ser.data)

class SecondMenuModelViewSet(ModelViewSet):
    queryset = models.Permission.objects.filter(parent_permission__isnull=True).order_by("pk")
    serializer_class = SecondMenuSerializer

    def retrieve(self,request,pk):
        permission=models.Permission.objects.filter(firstmenu__pk=pk).order_by("pk")
        ser = self.serializer_class(permission,many=True)
        return Response(ser.data)



class PermissionMenuModelViewSet(ModelViewSet):
    queryset = models.Permission.objects.filter(parent_permission__isnull=False).order_by("pk")
    serializer_class = PermissionMenuSerializer


    def retrieve(self,request,pk):
        permission=models.Permission.objects.filter(parent_permission__pk=pk).order_by("pk")
        ser = self.serializer_class(permission,many=True)
        return Response(ser.data)