# Generated by Django 3.0.3 on 2020-03-22 19:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('rbac', '0020_auto_20200322_1248'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=50, verbose_name='文章标题')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('content', models.TextField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rbac.UserInfo', verbose_name='作者')),
            ],
            options={
                'verbose_name': 'manager--咨询文章表',
                'verbose_name_plural': 'manager--咨询文章表',
                'db_table': 'manager--咨询文章表',
            },
        ),
    ]
