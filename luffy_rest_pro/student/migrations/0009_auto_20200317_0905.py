# Generated by Django 3.0.3 on 2020-03-17 09:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0008_coupon_couponrecord_order_orderdetail_transactionrecord'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='coupon',
            options={'verbose_name': 'student-优惠券生成规则记录', 'verbose_name_plural': 'student-优惠券生成规则记录'},
        ),
        migrations.AlterModelOptions(
            name='couponrecord',
            options={'verbose_name': 'student-用户优惠券领取使用记录表', 'verbose_name_plural': 'student-用户优惠券领取使用记录表'},
        ),
        migrations.AlterModelOptions(
            name='order',
            options={'verbose_name': 'student-订单表', 'verbose_name_plural': 'student-订单表'},
        ),
        migrations.AlterModelOptions(
            name='orderdetail',
            options={'verbose_name': 'student-订单详细', 'verbose_name_plural': 'student-订单详细'},
        ),
        migrations.AlterModelOptions(
            name='transactionrecord',
            options={'verbose_name': 'student-贝里交易记录', 'verbose_name_plural': 'student-贝里交易记录'},
        ),
        migrations.AlterModelTable(
            name='coupon',
            table='student-优惠券生成规则记录',
        ),
        migrations.AlterModelTable(
            name='couponrecord',
            table='student-用户优惠券领取使用记录表',
        ),
        migrations.AlterModelTable(
            name='order',
            table='student-订单表',
        ),
        migrations.AlterModelTable(
            name='orderdetail',
            table='student-订单详细',
        ),
        migrations.AlterModelTable(
            name='transactionrecord',
            table='student-贝里交易记录',
        ),
    ]
