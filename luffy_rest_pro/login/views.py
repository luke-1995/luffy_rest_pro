#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
import uuid
import json
# 第三方模块
from rest_framework.views import APIView
from rest_framework.response import Response
# 本地库
from django.conf import settings
from rbac.models import UserInfo, ApiPermission
from utils.base_response import BaseResponse
from utils.redis_pool import *

"""
前端传过来数据 permission_list
redis = {
    permission_userid: {
        api_permission_id: {url:'....',method:'....'},
        api_permission_id: {url:'....',method:'....'},
        api_permission_id: {url:'....',method:'....'},
    }
}
"""
API_PERMISSION = settings.API_PERMISSION
CONN = redis.Redis(connection_pool=pool)


class LoginView(APIView):

    def post(self, request):
        r = BaseResponse()
        data = request.data
        username = data.get('username')
        password = data.get('password')
        if not username or not password:
            r.code = 1001
            r.errors = '用户名或密码为空'
            return Response(r.dic)
        user = UserInfo.objects.filter(username=username, password=password).first()
        if not user:
            r.code = 1002
            r.errors = '用户名或密码为错误'
            return Response(r.dic)
        self.init_permission(user)
        token = uuid.uuid4()
        CONN.set(str(token), user.id, ex=36000)
        r.data = {'access_token': token,
                  "user": dict(id=user.id, username=username, shop_cart_num=user.shop_cart_num, balance=user.balance)}
        return Response(r.dic)

    def init_permission(self, user):
        api_permission_qs = ApiPermission.objects.filter(role__userinfo=user).distinct()
        api_permission_dic = {}
        for api_permission in api_permission_qs:
            api_permission_dic[api_permission.id] = json.dumps(
                {
                    'id': api_permission.id,
                    'url': api_permission.url,
                    'method': api_permission.get_method_display(),
                },
                ensure_ascii=False
            )

        if api_permission_dic:
            key = API_PERMISSION % str(user.id)
            CONN.hmset(key, api_permission_dic)


class RegisterView(APIView):

    def post(self, request):
        r = BaseResponse()
        username = request.data.get('username')
        password = request.data.get('password')
        if username is None or password is None:
            r.code = 1005
            r.errors = '注册的用户名或密码为空'
            return Response(r.dic)
        if UserInfo.objects.filter(username=username).exists():
            r.code = 1006
            r.errors = '注册用户已存在'
            return Response(r.dic)
        user = UserInfo.objects.create(username=username, password=password)
        user.roles.set(*["3"])  # 通过该接口默认分配学生角色
        r.data = {'user': dict(id=user.id, username=username, shop_cart_num=user.shop_cart_num)}
        return Response(r.dic)
