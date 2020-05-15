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
from .views.report_forms import ReportFormsView
from .views.order import OrderView
from .views.article import ArticleView
from .views.dis_stu import DistributionStudentView
from .views.teacher_record import TeacherRecordView

# from .views


urlpatterns = [

    path('report_forms/', ReportFormsView.as_view()),
    path('order_menu/', OrderView.as_view(dict(get='list', post='create'))),
    path('order_menu/<int:pk>/', OrderView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('article/', ArticleView.as_view(dict(get='list', post='create'))),
    path('article/<int:pk>/', ArticleView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('dis_stu/', DistributionStudentView.as_view(dict(get='list'))),
    path('dis_stu/<int:pk>/', DistributionStudentView.as_view(dict(get='retrieve', patch='update'))),
    path('teacher_record/', TeacherRecordView.as_view(dict(get='list', post='create'))),
    path('teacher_record/<int:pk>/', TeacherRecordView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),

]
