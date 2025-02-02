# Generated by Django 3.0.3 on 2020-03-26 08:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('rbac', '0028_auto_20200324_1741'),
    ]

    operations = [
        migrations.CreateModel(
            name='ApiPermission',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.CharField(blank=True, max_length=32, null=True, verbose_name='标题')),
                ('path', models.CharField(blank=True, max_length=128, null=True, verbose_name='含正则的URL')),
                ('method', models.CharField(blank=True, max_length=32, null=True, verbose_name='请求方式')),
                ('permission', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='rbac.Permission')),
            ],
            options={
                'verbose_name': 'rbac-api权限表',
                'verbose_name_plural': 'rbac-api权限表',
                'db_table': 'rbac-api权限表',
            },
        ),
    ]
