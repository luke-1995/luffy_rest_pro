# Generated by Django 3.0.3 on 2020-03-17 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rbac', '0016_auto_20200313_1232'),
    ]

    operations = [
        migrations.AddField(
            model_name='userinfo',
            name='balance',
            field=models.IntegerField(default=0, verbose_name='贝里余额'),
        ),
    ]
