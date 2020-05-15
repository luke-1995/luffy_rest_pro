"""luffy_rest_pro URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path

from .views.aside_menu import AsideMenuView
from .views.menu import MenuModelViewSet, SecondMenuModelViewSet, PermissionMenuModelViewSet
from .views.permission_text import PermissionView, HasPermissionView
from .views.role import RoleModelViewSet
from .views.text import Text
from .views.user import UserModelViewSet
from .views.permission import PermissionViewSet

urlpatterns = [
    path('role/', RoleModelViewSet.as_view(dict(get='list', post='create'))),
    path('role/<int:pk>/', RoleModelViewSet.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('menu/', MenuModelViewSet.as_view(dict(get='list', post='create'))),
    path('menu/<int:pk>/', MenuModelViewSet.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('second_menu/', SecondMenuModelViewSet.as_view(dict(get='list', post='create'))),
    path('second_menu/<int:pk>/', SecondMenuModelViewSet.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('permission_menu/', PermissionMenuModelViewSet.as_view(dict(get='list', post='create'))),
    path('permission_menu/<int:pk>/', PermissionMenuModelViewSet.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('text/', Text.as_view()),
    path('user/', UserModelViewSet.as_view(dict(get='list', post='create'))),
    path('user/<int:pk>/', UserModelViewSet.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    # path('permission/', PermissionView.as_view()),
    # path('permission/<int:pk>/<int:is_uid>/', HasPermissionView.as_view()),
    # path('permission/<int:pk>/', HasPermissionView.as_view()),
    # path('aside_menu/', PermissionViewSet.as_view()),
    path('permission/', PermissionViewSet.as_view(dict(get='list'))),


]
