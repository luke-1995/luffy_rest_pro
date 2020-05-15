#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import serializers
# 本地库
from ..models import StudyCourse
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


def get_serializer(model_class):
    class ModelSerializer(serializers.ModelSerializer):
        chapter_info = serializers.SerializerMethodField(read_only=True)
        title = serializers.CharField(source='course.title')

        def get_chapter_info(self, obj):
            chapter_qs = obj.course.course_chapters.all().order_by('chapter')

            return [{
                'id': chapter.id,
                'title': chapter.title,
                'chapter': chapter.chapter,
                'sections': [
                    {
                        'id': section.id,
                        'title': section.title,
                        'section_type': section.section_type,
                        'section_link': section.section_link,
                    }
                    for section in chapter.course_sections.all().order_by('section_order')],
            } for chapter in chapter_qs]

        class Meta:
            model = model_class
            fields = ['id', 'title', 'chapter_info']

    return ModelSerializer


class ClassRoomView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

    def get(self, request):
        user_id = request.user.id
        qs = StudyCourse.objects.filter(account=user_id)
        ser = get_serializer(StudyCourse)(qs, many=True)
        return Response(ser.data)
