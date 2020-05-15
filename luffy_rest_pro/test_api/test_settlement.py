#!usr/bin/env python
# -*- coding:utf-8 -*-

import pytest
import json
import requests
import redis
from django.conf import settings
from rbac.models import UserInfo
from student.models import StudyCourse
from utils.redis_pool import pool

# from student.models import StudyCourse


pytestmark = pytest.mark.django_db


@pytest.mark.django_db
class TestSettlement():
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
        SETTLEMENT = settings.SETTLEMENT
        GLOBAL_COUPON = settings.GLOBAL_COUPON
        self.url = 'http://127.0.0.1:8000/settlement/'
        self.headers = headers
        self.user_id = 1
        self.course_id = 1
        self.price_policy_id = 1
        # 正常测试用例(请保证优惠卷都是在有限期内,否则测试报错)
        self.data = {
            'add': {'course_list': [1]},
            'edit': {'global_coupon_id': 2, 'coupon_id': 1, 'course_id': 1},
            'edit1': {'coupon_id': 3, 'course_id': 1},
            'edit2': {'global_coupon_id': 4, 'course_id': 1},
            'edit3': {'global_coupon_id': 0, 'coupon_id': 0, 'course_id': 1},
        }

        # 空白测试用例
        self.b_data = {}

        # 含有错误信息的测试用例
        self.err_data = {
            'add': {'course_list': [99]},
            'edit': {'global_coupon_id': 1, 'coupon_id': 1, 'course_id': ''},
            'edit1': {'global_coupon_id': 99, 'course_id': 1},
            'edit2': {'coupon_id': 99, 'course_id': 1},
            'edit3': {'coupon_id': 1, 'course_id': 99},
            'edit4': {'global_coupon_id': 1, 'coupon_id': 1, 'course_id': 99},
            'edit5': { 'course_id': 1},# 只有course_id
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


    @staticmethod
    def is_valid(dic):
        assert isinstance(dic, dict)
        assert 'code' in dic
        assert 'data' in dic
        assert 'errors' in dic

    def test_sm_add(self):
        data = self.b_data
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1031

    def test_sm_add_1(self):
        data = self.err_data['add']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1030

    def test_sm_add_2(self):
        # 购物车不存在进行结算
        name = self.SHOPPING_CAR % (str(self.user_id), str(self.course_id))
        self.CONN.delete(name)
        data = self.data['add']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1030

    def test_sm_add_3(self):
        # 添加了购物车后进行结算
        self.add_sc()
        data = self.data['add']
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    def test_sm_list(self):
        res = requests.get(self.url, headers=self.headers)
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    # 空白
    def test_sm_edit(self):
        # 如果不选优惠卷,返回的id应为0,而不是None
        data = self.err_data['edit']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1031

    def test_sm_edit_1(self):
        # 选择了全局优惠卷,但id错误
        data = self.err_data['edit1']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1033

    # 错误
    def test_sm_edit_2(self):
        data = self.err_data['edit2']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1035

    def test_sm_edit_3(self):
        data = self.err_data['edit3']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1030

    def test_sm_edit_4(self):
        data = self.err_data['edit3']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1030

    def test_sm_edit_5(self):
        data = self.err_data['edit5']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1031

    # 正确
    def test_sm_edit_6(self):
        data = self.data['edit']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    def test_sm_edit_7(self):
        data = self.data['edit1']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    def test_sm_edit_8(self):
        data = self.data['edit2']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    def test_sm_edit_9(self):
        data = self.data['edit3']
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000


if __name__ == "__main__":
    pytest.main(["-s -v", "test_settlement.py"])