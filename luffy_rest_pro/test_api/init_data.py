# from django.test import TestCase

# Create your tests here.

import os
import django

os.environ.setdefault('DJANGO_SETTING_MODULE', 'luffy_rest_pro.settings')
django.setup()

def init_order(user_id):
    from student.models import Order,StudyCourse,TransactionRecord
    from rbac.models import UserInfo
    Order.objects.filter(account=user_id).delete()
    TransactionRecord.objects.filter(account=user_id).delete()
    StudyCourse.objects.filter(account=user_id).delete()
    UserInfo.objects.filter(pk=user_id).update(balance=10)


if __name__ == '__main__':
    init_order(1)
    print('Done......')
