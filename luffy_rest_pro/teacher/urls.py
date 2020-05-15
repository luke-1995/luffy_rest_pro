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
from .views.student_record import StudentRecordView
from .views.student_list import StudentListView
from .views.teacher_answer import TeacherAnswerView
from .views.teacher_correction import TeacherCorrectionView,CorrectionFileView

urlpatterns = [
    path('student_record/', StudentRecordView.as_view(dict(post='create'))),
    path('student_record/<int:pk>/', StudentRecordView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('student_record_list/<int:pk>/', StudentRecordView.as_view(dict(get='list'))),
    path('student_list/', StudentListView.as_view(dict(get='list', post='create'))),
    path('teacher_answer/', TeacherAnswerView.as_view(dict(get='list', post='create'))),
    path('teacher_answer/<int:pk>/', TeacherAnswerView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('teacher_correction/', TeacherCorrectionView.as_view(dict(get='list'))),
    path('teacher_correction/<int:pk>/', TeacherCorrectionView.as_view(dict(patch='update'))),
    path('correction_file/<int:pk>/',CorrectionFileView.as_view())


]
