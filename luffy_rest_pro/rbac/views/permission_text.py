#!usr/bin/env python
# -*- coding:utf-8 -*-
from rest_framework.response import Response
from rest_framework.views import APIView

# 本地库
from .. import models
from ..serializers.rbac import RoleSerializer
from utils.base_response import BaseResponse


class PermissionView(APIView):

    def get(self, request):
        # 进来要做用户认证,现在写死了
        user = models.UserInfo.objects.filter(pk=1).first()
        # 获取用户的角色的二级菜单权限
        # permission = models.Permission.objects.filter(role__userinfo=user,firstmenu__isnull=False).values("id","title")
        res = BaseResponse()
        all_permission_dic = self.get_all_permission()
        res.data = dict(all_permission=[])
        for key, value in all_permission_dic.items():
            res.data["all_permission"].append(value)
        return Response(res.dic)

    @staticmethod
    def get_all_permission():
        firstmenu_qs = models.FirstMenu.objects.all()
        secondment_qs = models.Permission.objects.filter(firstmenu__isnull=False)
        permission_qs = models.Permission.objects.filter(parent_permission__isnull=False)
        all_permission_dic = {}
        for firstmenu in firstmenu_qs:
            all_permission_dic[firstmenu.id] = dict(title=firstmenu.title,disabled=True,children=[])
        all_secondment = {}
        for secondment in secondment_qs:
            all_secondment[secondment.id] = dict(id=secondment.id, title=secondment.title, children=[])
        for permission in permission_qs:
            if permission.parent_permission.id in all_secondment:
                all_secondment[permission.parent_permission.id]["children"].append(
                    dict(id=permission.id, title=permission.title))
        for secondment in secondment_qs:
            if secondment.firstmenu.id in all_permission_dic:
                all_permission_dic[secondment.firstmenu.id]["children"].append(all_secondment[secondment.id])
        print(all_permission_dic)
        return all_permission_dic


class HasPermissionView(APIView):

    def get(self, request, pk,is_uid):
        res = BaseResponse()
        if is_uid:
            user = models.UserInfo.objects.filter(pk=pk).first()
            has_permission = self.has_permission(user)
            res.data = has_permission
        else:
            role = models.Role.objects.filter(pk=pk).first()
            has_permission = self.has_permission_1(role)
            res.data = has_permission
        return Response(res.dic)

    def patch(self,request,pk):
        res = BaseResponse()
        data = request.data
        role_obj=self.set_permission(data)
        print(role_obj.permissions.all())
        return Response(res.dic)

    @staticmethod
    def has_permission(user):
        permission_qs = models.Permission.objects.filter(role__userinfo=user).distinct()
        ret = []
        for permission in permission_qs:
            ret.append(permission.id)
        return ret

    @staticmethod
    def has_permission_1(role):
        permission_qs = models.Permission.objects.filter(role=role).distinct()
        ret = []
        for permission in permission_qs:
            ret.append(permission.id)
        return ret

    @staticmethod
    def set_permission(data):
        role_id=data.get("id")
        permissions=list(map(str,data.get("permissions")))
        role_obj = models.Role.objects.filter(pk=role_id).first()
        role_obj.permissions.clear()
        role_obj.permissions.add(*permissions)
        return role_obj
