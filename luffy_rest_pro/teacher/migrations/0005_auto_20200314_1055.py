# Generated by Django 3.0.3 on 2020-03-14 10:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0004_auto_20200314_1053'),
    ]

    operations = [
        migrations.AlterField(
            model_name='homeworkrecord',
            name='homework_status',
            field=models.IntegerField(choices=[(1, '未提交'), (2, '已提交'), (3, '已批改')], default=1, verbose_name='作业状态'),
        ),
    ]
