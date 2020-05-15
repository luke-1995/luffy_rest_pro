#!usr/bin/env python
# -*- coding:utf-8 -*-
import redis
import re
import json
from rest_framework.permissions import BasePermission
from django.conf import settings
from .redis_pool import pool

LOGIN_WHITE_LIST = settings.LOGIN_WHITE_LIST

CONN = redis.Redis(connection_pool=pool)
API_PERMISSION = settings.API_PERMISSION

class ProvePermission(BasePermission):
    message = "您没有权限"

    def has_permission(self, request, view):
        # 判断用户是否有权限
        method = request.META.get('REQUEST_METHOD')
        if method != "OPTIONS":
            user = request.user
            key = API_PERMISSION % str(user.id)
            api_permission_dic = CONN.hgetall(key)
            path = request.path_info
            Method = request.method
            flag = False
            for URL in LOGIN_WHITE_LIST:
                url = r'^%s$' % URL
                if re.match(url, path):
                    return True
            for permission in api_permission_dic.values():
                permission = json.loads(permission, encoding='utf8')
                url = r'^%s$' % permission['url']
                method = r'^%s$' % permission['method']
                if re.match(url, path) and re.match(method, Method):
                    flag = True
                    break
            return flag
        return True
