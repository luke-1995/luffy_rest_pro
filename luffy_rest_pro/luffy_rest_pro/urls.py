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
from django.contrib import admin
from django.urls import path, re_path, include
from django.views.static import serve
from luffy_rest_pro import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    re_path('media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    re_path(r'^', include(('rbac.urls', 'rbac'))),
    re_path(r'^', include(('teacher.urls', 'teacher'))),
    re_path(r'^', include(('student.urls', 'student'))),
    re_path(r'^', include(('manager.urls', 'manager'))),
    re_path(r'^auth/', include(('login.urls', 'login'))),

]
