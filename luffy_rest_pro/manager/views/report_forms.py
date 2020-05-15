#!usr/bin/env python
# -*- coding:utf-8 -*-
import datetime
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Count
from django.db.models.functions import TruncDay
# 本地库
from rbac.models import UserInfo
from student.models import Order
from utils.base_response import BaseResponse
from utils.base_auth import BaseAuth
from utils.base_permission import ProvePermission


# from rbac.forms.role import RoleForm
# from rbac.utils.get_all_url import get_all_url

# def y_m_count_1(blog_obj):
#     # 查询当前站点的每一个年月的文章数,方法二
#     dic = Article.objects.filter(user__blog=blog_obj).annotate(month=TruncMonth('create_time')).values(
#         "month").annotate(
#         c=Count("pk")).values_list("month", "c")
#     return dic



class ReportFormsView(APIView):
    authentication_classes = [BaseAuth, ]
    permission_classes = [ProvePermission, ]


    def get(self,request):
        res = BaseResponse()
        register_qs=UserInfo.objects.filter(roles__in=[3]).annotate(day=TruncDay('date')).values(
            "day").annotate(
            c=Count("pk")).values_list("day", "c").order_by('day')
        # print(dic)
        order_qs = Order.objects.filter(status=0).annotate(day=TruncDay('pay_time')).values(
            "day").annotate(
            c=Count("pk")).values_list("day", "c").order_by('day')
        register = {'x':[datetime.datetime.date(li[0]) for li in register_qs],'y':[li[1] for li in register_qs]}
        order = {'x':[datetime.datetime.date(li[0]) for li in order_qs],'y':[li[1] for li in order_qs]}
        res.data = {'register':register,'order':order}
        return Response(res.dic)

