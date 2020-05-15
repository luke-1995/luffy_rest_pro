#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.viewsets import ModelViewSet
from rest_framework import serializers


# 本地库

def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        class Meta:
            model = model_class
            fields = '__all__'

    return ModelSerializer


def get_base_modelviewset(model_class):
    class BaseModelViewSet(ModelViewSet):
        queryset = model_class.objects.all()
        serializer_class = get_serializer(model_class)



    return BaseModelViewSet
