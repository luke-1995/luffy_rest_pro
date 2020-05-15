from django.db import models
from rbac.models import UserInfo
# Create your models here.
__all__ = ['Article']

class Article(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=50, verbose_name='文章标题')
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    content = models.TextField()
    user = models.ForeignKey(verbose_name='作者', to=UserInfo,on_delete=models.CASCADE)


    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = 'manager--资讯文章表'
        db_table=verbose_name_plural
        verbose_name = verbose_name_plural