#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
from rest_framework.exceptions import NotFound
# 本地库
from utils.base_modelview import get_base_modelviewset
from student.models import Question
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(Question)


class StudentQuestionView(view_class):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]
    # serializer_class=BaseSerializer
    # queryset=Question.objects.filter(student=1) # 这里以后需要从request.user对象红中获取
    def get_queryset(self):
        user = self.request.user
        return Question.objects.filter(student=user)

    def create(self,request):
        data = request.data
        student = request.user
        teacher = student.teacher
        if not teacher:
            raise NotFound('还未分配老师')
        data['teacher'] = teacher.pk
        data['student'] = student.pk
        serializer = self.serializer_class(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)
