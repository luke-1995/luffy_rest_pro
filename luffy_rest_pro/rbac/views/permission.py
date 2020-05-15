#!usr/bin/env python
# -*- coding:utf-8 -*-
from rest_framework.viewsets import ModelViewSet
from rest_framework import serializers
from rest_framework.response import Response
# 本地库
from .. import models
from ..serializers.rbac import RoleSerializer
from rbac.models import FirstMenu,Permission
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

def get_serializer(model_class,user):


    class ModelSerializer(serializers.ModelSerializer):
        children = serializers.SerializerMethodField(read_only=True)
        meta = serializers.SerializerMethodField(read_only=True)

        def get_children(self,obj):
            qs = Permission.objects.filter(role__userinfo=user,firstmenu=obj).distinct()
            return [{
                'path':permission.path,
                'name':permission.name,
                'component':permission.component,
                'hidden':permission.hidden,
                'meta':{'title':permission.title},
            }for permission in qs]

        def get_meta(self,obj):
            return {'title':obj.title}

        class Meta:
            model = model_class
            fields = [
                'meta',
                'component',
                'path',
                'redirect',
                'children'
            ]

    return ModelSerializer


class PermissionViewSet(ModelViewSet):
    queryset = models.Role.objects.all()
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def list(self,request):
        user =request.user
        firstmenu=FirstMenu.objects.filter(permission__role__userinfo=user).distinct()
        ser = get_serializer(FirstMenu,user)(firstmenu,many=True)
        return Response(ser.data)
