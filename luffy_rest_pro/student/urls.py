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
from .views.category import CategoryView
from .views.course import CourseView
from .views.course_detail import CourseDetailView
from .views.shopping_cart import ShoppingCartView
from .views.settlement import SettlementView
from .views.payment import PaymentView
from .views.order import OrderView
from .views.classroom import ClassRoomView
from .views.homework import HomeworkView, HomeworkRecordFileView
from .views.section import SectionView
from .views.learning_progress import LearningProgressView
from .views.student_question import StudentQuestionView
from .views.course_menu import CourseViewSet

# from .views.list import ListView
#
#
#
urlpatterns = [

    # path('student_list/', StudentRecordView.as_view(dict(get='list', post='create'))),
    # path('student_record/<int:pk>/', StudentRecordView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('category/', CategoryView.as_view(dict(get='list'))),
    path('course/', CourseView.as_view(dict(get='list', post='create'))),
    path('course/<int:pk>/', CourseView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('course_detail/', CourseDetailView.as_view(dict(get='list', post='create'))),
    path('course_detail/<int:pk>/', CourseDetailView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('shopping_cart/', ShoppingCartView.as_view()),
    path('settlement/', SettlementView.as_view()),
    path('payment/', PaymentView.as_view()),
    path('order/', OrderView.as_view()),
    path('classroom/', ClassRoomView.as_view()),
    path('homework/<int:pk>/', HomeworkView.as_view()),
    path('homework_file/<int:pk>/', HomeworkRecordFileView.as_view()),
    path('section/<int:pk>/', SectionView.as_view()),
    path('learning_progress/', LearningProgressView.as_view(dict(get='list'))),
    path('learning_progress/<int:pk>/', LearningProgressView.as_view(dict(patch='update'))),
    path('student_question/', StudentQuestionView.as_view(dict(get='list', post='create'))),
    path('student_question/<int:pk>/',
         StudentQuestionView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    path('course_menu/', CourseViewSet.as_view(dict(get='list', post='create'))),
    path('course_menu/<int:pk>/',
         CourseViewSet.as_view(dict(get='retrieve', patch='update', delete='destroy'))),
    # path('shopping_cart/<int:pk>/', ShoppingCartView.as_view(dict(get='retrieve', patch='update', delete='destroy'))),

]

a=1