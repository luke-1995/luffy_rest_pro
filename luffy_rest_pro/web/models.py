# from django.db import models
#
# # Create your models here.
#
# class Question(models.Model):
#     """
#     问题表
#     """
#     student = models.ForeignKey(verbose_name="学生", to='Student',on_delete=models.CASCADE)
#     teacher = models.ForeignKey(verbose_name="导师", to='Student',on_delete=models.CASCADE)
#     title=models.CharField(max_length=50, verbose_name='问题标题')
#     content = models.CharField(max_length=500, verbose_name='问题内容')
#     answer = models.CharField(max_length=500, verbose_name='回答内容')
#     question_status_choices = [
#         (1, "未回答"),
#         (2, "已回答"),
#     ]
#     homework_status = models.IntegerField(verbose_name="问题回答状态", choices=question_status_choices, default=1)
#
#
# class CourseModel(models.Model):
#     '''
#     课程模块
#     '''
#     course = models.CharField(max_length=32, verbose_name='课程')
#     title = models.CharField(max_length=50, verbose_name='模块名称')
#     homework = models.CharField(max_length=50, verbose_name='作业')
#     coursechapter = models.CharField(max_length=50, verbose_name='课程章节表')
#
