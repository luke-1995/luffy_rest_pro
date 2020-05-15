#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from student.models import Question
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(Question)


class BaseSerializer(serializers.ModelSerializer):
    student_name = serializers.CharField(read_only=True,source='student.username')
    question_status = serializers.CharField(write_only=True)
    question_status_info = serializers.CharField(source="get_question_status_display",read_only=True)

    class Meta:
        model = Question
        fields = ['id','title','content','answer','question_status','student','teacher','student_name','question_status_info']





class TeacherAnswerView(view_class):
    serializer_class=BaseSerializer
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def list(self,request):
        teacher = request.user
        qs = Question.objects.filter(teacher=teacher).order_by('-id','question_status')
        ser = self.serializer_class(qs,many=True)
        return Response(ser.data)
