#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
# 本地库

import pytest
from django.conf import settings


@pytest.fixture(scope='session')
def django_db_setup():
    settings.DATABASES['default'] = {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'luffy',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST': '127.0.0.1',
        'PORT': 3306,
    }