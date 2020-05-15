#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
# 本地库

class BaseResponse:

    def __init__(self):
        self.code = 1000
        self.data = None
        self.errors = None

    @property
    def dic(self):
        return self.__dict__

