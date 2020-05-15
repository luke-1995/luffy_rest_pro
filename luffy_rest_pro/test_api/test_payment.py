#!usr/bin/env python
# -*- coding:utf-8 -*-

import pytest
import json
import requests
import redis
from django.conf import settings
from rbac.models import UserInfo
from student.models import StudyCourse, Order, OrderDetail
from utils.redis_pool import pool






pytestmark = pytest.mark.django_db


@pytest.mark.django_db
class TestPayment():
    pytestmark = pytest.mark.django_db



    def setup_class(self):
        login_url = 'http://127.0.0.1:8000/auth/login/'
        data = {
            'username': 'a',
            'password': '123'
        }
        res = requests.post(login_url, data=data)
        ret = res.json()
        access_token = ret.get('data').get('access_token')
        headers = {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36',
            'Content-Type': 'application/json;multipart/form-data',
            'Authorization': access_token,
        }
        self.CONN = redis.Redis(connection_pool=pool)
        self.SHOPPING_CAR = settings.SHOPPING_CAR
        self.SETTLEMENT = settings.SETTLEMENT
        self.GLOBAL_COUPON = settings.GLOBAL_COUPON
        self.url = 'http://127.0.0.1:8000/payment/'
        self.headers = headers
        self.user_id = 1
        self.course_id = 1
        self.price_policy_id = 1
        # 正常测试用例,该测试用例的优惠卷默认不使用
        self.data = {
            'post': {'balance': 0, 'total_price': 7},  # 不用贝里
            'post1': {'balance': 7, 'total_price': 0},  # 使用贝里

        }

        # 空白测试用例
        self.b_data = {}

        # 含有错误信息的测试用例
        self.err_data = {
            'post': {'balance': 99, 'total_price': 7},  # 贝里异常
            'post1': {'balance': 0, 'total_price': 99},  # 总额异常
        }

    def add_sc(self):
        # 加入购物车
        data = {
            'course_id': self.course_id,
            'price_policy_id': self.price_policy_id,
        }
        res = requests.post('http://127.0.0.1:8000/shopping_cart/', headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        if StudyCourse.objects.filter(account=self.user_id, course_id=self.course_id).exists():
            assert dic['code'] == 1024
        else:
            assert dic['code'] == 1000

    def add_sm(self):
        # 默认不选优惠卷
        self.add_sc()
        data = {'course_list': [1]}
        res = requests.post('http://127.0.0.1:8000/settlement/', headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    @staticmethod
    def is_valid(dic):
        assert isinstance(dic, dict)
        assert 'code' in dic
        assert 'data' in dic
        assert 'errors' in dic

    def test_pm_post(self):
        # 结算中心不存在
        sm_name = self.SETTLEMENT % (str(self.user_id), str(self.user_id))
        sm_name_1 = self.SETTLEMENT % (str(self.user_id), str(3))
        global_name = self.GLOBAL_COUPON % str(self.user_id)
        sc_name=self.SHOPPING_CAR % (self.user_id, str(3))
        self.CONN.delete(sm_name) # 删除课程id为1的结算中心
        self.CONN.delete(sm_name_1) # 删除课程id为3的结算中心
        self.CONN.delete(global_name)  # 删除全局优惠卷
        self.CONN.delete(sc_name)  # 删除课程id为3的购物车
        data = self.data['post']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1081

    def test_pm_post_1(self):
        # 结算中心存在进行结算
        self.add_sm()
        data = self.b_data  # 空白
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1081

    # 错误
    def test_pm_post_2(self):
        # 结算中心存在进行结算
        data = self.err_data['post']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1081

    def test_pm_post_3(self):
        # 结算中心存在进行结算
        data = self.err_data['post1']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1081

    # 正常
    def del_order(self):
        print(Order.objects.filter(account=self.user_id))
        Order.objects.filter(account=self.user_id).delete()
        print(Order.objects.filter(account=self.user_id))

    def test_pm_post_4(self):
        # 如果有订单数据,先删除,以便做测试
        # 请先运行init_data脚本,做数据初始化
        data = self.data['post']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000
        assert Order.objects.filter(account=self.user_id, payment_type=0, actual_amount=7, status=1,
                                    payment_number__isnull=True).exists()

    def test_pm_post_5(self):
        # 结算中心存在进行结算
        # 请先运行init_data脚本,做数据初始化
        self.add_sm()
        data = self.data['post1']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000
        assert Order.objects.filter(account=self.user_id, payment_type=3, actual_amount=0, status=0,
                                    payment_number__isnull=True).exists()

if __name__ == "__main__":
    pytest.main(["-s -v", "test_payment.py"])