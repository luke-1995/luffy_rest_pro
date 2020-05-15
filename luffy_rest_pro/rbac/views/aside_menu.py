#!usr/bin/env python
# -*- coding:utf-8 -*-
from rest_framework.response import Response
from rest_framework.views import APIView
# 本地库
from utils.base_response import BaseResponse
from .. import models


class AsideMenuView(APIView):


    def get(self,request):
        # 需要用户认证
        user = models.UserInfo.objects.filter(pk=1).first()
        res=BaseResponse()
        menu=self.get_menu(user)
        res.data=menu
        return Response(res.dic)

    @staticmethod
    def get_menu(user):
        firstmenu_qs = models.FirstMenu.objects.filter(permission__role__userinfo=user).distinct()
        secondment_qs = models.Permission.objects.filter(role__userinfo=user,parent_permission__isnull=True).distinct()
        menu = []
        secondment_dic={}
        for secondment in secondment_qs:
            dic=dict(id=secondment.id,title=secondment.title,url=secondment.url,router_name=secondment.router_name)
            if secondment.firstmenu.id in secondment_dic:
                secondment_dic[secondment.firstmenu.id].append(dic)
            else:
                secondment_dic[secondment.firstmenu.id]=[dic]
        for firstmenu in firstmenu_qs:
            menu_obj = dict(title=firstmenu.title,children=secondment_dic.get(firstmenu.id))
            menu.append(menu_obj)
        return menu
