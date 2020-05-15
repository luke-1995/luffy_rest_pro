#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
from rest_framework.viewsets import ModelViewSet
# 本地库
from utils.base_modelview import get_base_modelviewset
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        class Meta:
            model = model_class
            fields = ['id','username','learning_progress']
            extra_kwargs = {
                "id": {"read_only": True},
                "username": {"read_only": True},
            }

    return ModelSerializer


class LearningProgressView(ModelViewSet):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]
    serializer_class = get_serializer(UserInfo)
    queryset = UserInfo.objects.filter(roles__in=[3])
