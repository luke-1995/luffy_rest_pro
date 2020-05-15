# Generated by Django 3.0.3 on 2020-03-05 21:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rbac', '0006_icon_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='userinfo',
            name='password',
            field=models.CharField(blank=True, max_length=64, null=True, verbose_name='密码'),
        ),
        migrations.AlterField(
            model_name='icon',
            name='title',
            field=models.CharField(max_length=32),
        ),
    ]
