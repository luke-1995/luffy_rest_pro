# Generated by Django 3.0.3 on 2020-03-15 20:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0004_shoppingcart'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='shoppingcart',
            name='course',
        ),
        migrations.AddField(
            model_name='shoppingcart',
            name='course',
            field=models.ManyToManyField(related_name='cart_course', to='student.Course', verbose_name='购物车课程'),
        ),
    ]
