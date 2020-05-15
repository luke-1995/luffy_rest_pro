#!usr/bin/env python
# -*- coding:utf-8 -*-
from rest_framework.viewsets import ModelViewSet

# 本地库
from .. import models
from ..serializers.rbac import UserinfoSerializer

class UserModelViewSet(ModelViewSet):
    queryset = models.UserInfo.objects.all()
    serializer_class = UserinfoSerializer