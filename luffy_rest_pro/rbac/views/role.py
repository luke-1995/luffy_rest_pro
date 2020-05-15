#!usr/bin/env python
# -*- coding:utf-8 -*-
from rest_framework.viewsets import ModelViewSet

# 本地库
from .. import models
from ..serializers.rbac import RoleSerializer


# from rbac.forms.role import RoleForm
# from rbac.utils.get_all_url import get_all_url


class RoleModelViewSet(ModelViewSet):
    queryset = models.Role.objects.all()
    serializer_class = RoleSerializer
    # def post(self,request):
    #     serializer = RoleSerializer(data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     else:
    #         return Response(serializer.errors)
    #
    #
    # def get(self,request):
    #     role=models.Role.objects.all()
    #     ser = RoleSerializer(role,many=True)
    #     return Response(ser.data)
    #
    # def put(self,request):
    #     role=models.Role.objects.all()
    #     serializer = RoleSerializer(role, data=request.data, partial=True)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     else:
    #         return Response(serializer.errors)
    #
    # def delete(self,request):
    #     return