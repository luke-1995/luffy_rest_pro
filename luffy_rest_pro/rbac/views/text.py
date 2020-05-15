#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
import json
# 第三方模块
from django.http import JsonResponse,HttpResponse
from django.core import serializers
from rest_framework.response import Response
from rest_framework.views import APIView
# 本地库
from utils.base_response import BaseResponse

# def text(request):
#     r=BaseResponse()
#     r.data={id:1,"title":"title"}
#
#     return HttpResponse(json.dumps([{"id":1,"title":"title"}]))

class Text(APIView):

    def get(self,request):
        r = BaseResponse()
        r.data={"id":1,"title":"title"}
        return Response(r.dic)