#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
import redis
# 本地库

pool=redis.ConnectionPool(max_connections=10,decode_responses=True)

