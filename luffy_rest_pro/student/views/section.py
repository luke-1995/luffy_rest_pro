#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import serializers
# 本地库
from ..models import CourseSection
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


def get_serializer(model_class):

    class ModelSerializer(serializers.ModelSerializer):
        chapter = serializers.CharField(source='chapter.title', read_only=True)

        class Meta:
            model = model_class
            fields = '__all__'

    return ModelSerializer


class SectionView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def get(self,request,pk):
        # user_id=1 #先写死
        user_id=request.user.id
        qs=CourseSection.objects.filter(chapter__course__studycourse__account=1,chapter=pk).order_by('section_order')
        ser = get_serializer(CourseSection)(qs,many=True)
        return Response(ser.data)