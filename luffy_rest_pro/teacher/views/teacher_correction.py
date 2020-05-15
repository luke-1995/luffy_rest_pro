#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
from rest_framework.views import APIView
# 本地库
from utils.base_modelview import get_base_modelviewset
from teacher.models import Homework, HomeworkRecord
from rbac.models import UserInfo
from utils.base_response import BaseResponse
from ..forms.teacher_correction import HomeworkRecordForm
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(HomeworkRecord)


class BaseSerializer(serializers.ModelSerializer):
    student_name = serializers.CharField(read_only=True, source='student.username')
    homework_status = serializers.CharField(write_only=True)
    file = serializers.CharField(read_only=True)
    homework_status_info = serializers.CharField(source="get_homework_status_display", read_only=True)
    title = serializers.CharField(source="homework.title", read_only=True)

    class Meta:
        model = HomeworkRecord
        fields = ['id', 'title', 'student_name', 'homework_status', 'file', 'homework_status_info', 'correction_file']
        # extra_kwargs = {"correction_file": {"write_only": True}}


class TeacherCorrectionView(view_class):
    serializer_class = BaseSerializer
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    # queryset=StudentRecord.objects.filter(teacher__pk=4) # 这里以后需要从request.user对象红中获取

    def list(self, request):
        teacher = request.user
        # teacher = UserInfo.objects.filter(pk=1).first() #写死了
        qs = HomeworkRecord.objects.filter(student__teacher=teacher).order_by('-id', 'homework_status')
        ser = self.serializer_class(qs, many=True)
        return Response(ser.data)


class CorrectionFileView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def post(self, request, pk):
        res = BaseResponse()
        correction_file = request.FILES.get('correction_file')
        if not correction_file:
            res.code = 1010
            res.errors = "上传批改结果为空"
            return Response(res.dic)
        obj = HomeworkRecord.objects.filter(pk=pk).first()
        form = HomeworkRecordForm(request.data, request.FILES, instance=obj)  # 注意获取数据的方式
        if form.is_valid():
            form.save()
            HomeworkRecord.objects.filter(pk=pk).update(homework_status=3)
            res.data = dict(homework_record_id=pk)
            return Response(res.dic)
        else:
            res.code = 1011
            res.errors = '上传失败,请重新上传'
            return Response(res.dic)
