# Generated by Django 3.0.3 on 2020-03-03 18:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rbac', '0002_firstmenu'),
    ]

    operations = [
        migrations.AlterField(
            model_name='firstmenu',
            name='title',
            field=models.CharField(max_length=32, verbose_name='一级菜单'),
        ),
    ]
