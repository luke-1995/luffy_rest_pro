#!usr/bin/env python
# -*- coding:utf-8 -*-
import redis
from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
from .redis_pool import pool
from rbac.models import UserInfo

CONN = redis.Redis(connection_pool=pool)


class BaseAuth(BaseAuthentication):

    def authenticate(self, request):
        # 从请求头中获取前端带过来的token

        method = request.META.get('REQUEST_METHOD')
        if method != "OPTIONS":
            token = request.META.get('HTTP_AUTHORIZATION')

            if token is None:
                raise AuthenticationFailed("没有携带token")

            user_id = CONN.get(str(token))
            if user_id == None:
                raise AuthenticationFailed("token过期")
            user_obj = UserInfo.objects.filter(id=user_id).first()
            return user_obj, token
        return None,None