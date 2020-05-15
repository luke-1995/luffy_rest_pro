from django.db import models

# Create your models here.
from rbac.models import UserInfo
from student.models import CourseChapter

__all__ = ["StudentRecord","HomeworkRecord","Homework"]

class StudentRecord(models.Model):
    """
    学生跟进记录
    """
    student = models.ForeignKey(verbose_name="跟进学生", to=UserInfo,related_name='sr_stu',on_delete=models.CASCADE)
    teacher = models.ForeignKey(verbose_name="导师", to=UserInfo,on_delete=models.CASCADE,related_name='sr_tea')
    note = models.TextField(verbose_name="跟进内容")
    date = models.DateField(verbose_name="跟进日期", auto_now_add=True)

    class Meta:
        verbose_name = "teacher-学生跟进表"
        db_table = verbose_name
        verbose_name_plural = verbose_name

class Homework(models.Model):
    '''
    作业表
    '''
    title = models.CharField(max_length=50, verbose_name='作业标题')
    content = models.CharField(max_length=500, verbose_name='作业内容')
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    chapter = models.ForeignKey(verbose_name="课程章节", to=CourseChapter, on_delete=models.CASCADE,null=True,blank=True)


    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "teacher-作业表"
        db_table = verbose_name
        verbose_name_plural = verbose_name


class HomeworkRecord(models.Model):
    """
    作业提交记录
    """
    student = models.ForeignKey(verbose_name="学生", to=UserInfo,on_delete=models.CASCADE,related_name='hr_stu',)
    homework = models.ForeignKey(verbose_name="作业", to='Homework',on_delete=models.CASCADE)
    file = models.FileField(verbose_name="作业文件",upload_to='homework/%Y-%m',null=True,blank=True)
    correction_file=models.FileField(verbose_name="批改过程",upload_to='correction/%Y-%m',null=True,blank=True,help_text="默认上传txt格式的文件")
    homework_status_choices = [
        (1, "未提交"),
        (2, "已提交"),
        (3, "已批改"),
    ]
    homework_status = models.IntegerField(verbose_name="作业状态", choices=homework_status_choices, default=1)
    mark = models.PositiveIntegerField(verbose_name="学生成绩",null=True,blank=True)
    comment = models.CharField(max_length=500, verbose_name='学生评价', null=True, blank=True)



    class Meta:
        verbose_name = "teacher-作业提交记录表"
        db_table = verbose_name
        verbose_name_plural = verbose_name