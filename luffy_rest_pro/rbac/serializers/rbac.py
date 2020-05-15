#!usr/bin/env python
# -*- coding:utf-8 -*-
# 内置模块
# 第三方模块
from rest_framework import serializers
# 本地库
from .. import models


class RoleSerializer(serializers.ModelSerializer):
    # permissions = serializers.CharField(read_only=True)

    class Meta:
        model = models.Role
        fields = ["id", "title"]


class MenuSerializer(serializers.ModelSerializer):



    class Meta:
        model = models.FirstMenu
        fields = ["id", "title"]


class SecondMenuSerializer(serializers.ModelSerializer):


    class Meta:
        model = models.Permission
        fields = ["id", "title","firstmenu"]
        extra_kwargs = {"firstmenu": {"write_only": True}}

class PermissionMenuSerializer(serializers.ModelSerializer):
    # permissions = serializers.CharField(read_only=True)


    def get_icon_info(self, obj):
        return obj.icon.content

    class Meta:
        model = models.Permission
        fields = ["id", "title","parent_permission"]
        extra_kwargs = {"parent_permission": {"write_only": True}}

# class MenuChangeSerializer(serializers.ModelSerializer):
#     icon_list = serializers.SerializerMethodField(read_only=True)
#
#     def get_icon_list(self, obj):
#         return list(models.Icon.objects.values("id", "content"))
#
#     class Meta:
#         model = models.FirstMenu
#         fields = ["id","title","icon_list"]
#         extra_kwargs = {"icon": {"write_only": True}}



class UserinfoSerializer(serializers.ModelSerializer):
    # permissions = serializers.CharField(read_only=True)

    class Meta:
        model = models.UserInfo
        fields = ["id", "username","password",'roles']
        extra_kwargs = {"password": {"write_only": True}}