# #!usr/bin/env python
# # -*- coding:utf-8 -*-
# # 内置模块
# from django import template
# # 第三方模块
# # 自定义模块
# from blog.utils.article_grouping import *
#
# register = template.Library()
#
#
# @register.inclusion_tag('grouping_content.html')
# def get_grouping_content(username):
#     user_obj = UserInfo.objects.filter(username=username).first()
#     article = Article.objects.filter(user=user_obj).all()
#     blog_obj = Blog.objects.filter(userinfo=user_obj).first()
#     category_list = category_count(blog_obj)
#     tag_list = tag_count(blog_obj)
#     y_m_list = y_m_count_1(blog_obj)
#     return locals()
