#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from student.models import Order
from rbac.models import UserInfo
from utils.base_pagination import BasePagination
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission

view_class = get_base_modelviewset(Order)


class OrderView(view_class):
    pagination_class = BasePagination
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]

