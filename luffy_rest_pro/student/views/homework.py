#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import serializers
# 本地库
from teacher.models import HomeworkRecord, Homework
from utils.base_response import BaseResponse
from student.models import StudyCourse
from ..forms.homework_record import HomeworkRecordForm
from utils import base_modelview
from rbac.models import UserInfo
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


def get_serializer(model_class, student):
    class ModelSerializer(serializers.ModelSerializer):
        homework_record = serializers.SerializerMethodField(read_only=True)

        def get_homework_record(self, obj):
            homework_record = HomeworkRecord.objects.filter(homework=obj, student=student).first()
            if homework_record:
                return {
                    'id': homework_record.id,
                    'file': str(homework_record.file),  # 文件对象转为字符串对象
                    'homework_status': homework_record.get_homework_status_display(),
                    'mark': homework_record.mark,
                    'comment': homework_record.comment,
                }
            else:
                hr = HomeworkRecord.objects.create(homework=obj, student=student)
                return {'id': hr.id, }

        class Meta:
            model = model_class
            fields = '__all__'

    return ModelSerializer


class HomeworkView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def get(self, request, pk):
        # user_id = 1  # 先写死
        user = request.user
        res = BaseResponse()
        homework_qs = Homework.objects.filter(chapter=pk)
        # 获取需要的数据,返回该章节的作业
        ser = get_serializer(Homework, user)(homework_qs, many=True)

        return Response(ser.data)

    def put(self, request, pk):
        qs = HomeworkRecord.objects.filter(pk=pk).first()
        serializer = base_modelview.get_serializer(HomeworkRecord)(qs, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors)


class HomeworkRecordFileView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def post(self, request, pk):
        res = BaseResponse()
        file = request.FILES.get('file')
        if not file:
            res.code = 1060
            res.errors = "上传批改结果为空"
            return Response(res.dic)
        obj = HomeworkRecord.objects.filter(pk=pk).first()
        form = HomeworkRecordForm(request.data, request.FILES, instance=obj)  # 注意获取数据的方式
        if form.is_valid():
            form.instance.homework_status = 2  # 作业状态改为已经提交
            form.save()
            res.data = dict(homework_record_id=pk, file=str(form.instance.file), homework_status='已提交')
            return Response(res.dic)
        else:
            res.code = 1061
            res.errors = '上传失败,请重新上传'
            return Response(res.dic)
