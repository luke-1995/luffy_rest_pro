#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework.response import Response
from rest_framework import serializers
# 本地库
from utils.base_modelview import get_base_modelviewset
from student.models import Category
from rbac.models import UserInfo

view_class = get_base_modelviewset(Category)


class CategoryView(view_class):
    pass

