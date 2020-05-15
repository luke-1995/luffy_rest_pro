#!usr/bin/env python
# -*- coding:utf-8 -*-

import pytest
import json
import requests
import token
from rbac.models import UserInfo
from student.models import StudyCourse

# from student.models import StudyCourse


pytestmark = pytest.mark.django_db


# @pytest.mark.django_db
# class TestUsers:
#     pytestmark = pytest.mark.django_db
#     def test_my_user(self):
#         pass
#         me = UserInfo.objects.get(username='a')
#         print(me)
#         assert me.username


@pytest.mark.django_db
class TestShopping():
    pytestmark = pytest.mark.django_db

    # def setup(self):
    #     print("setup: 每个用例开始前执行")
    #
    # def teardown(self):
    #     print("teardown: 每个用例结束后执行")

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
        self.url = 'http://127.0.0.1:8000/shopping_cart/'
        self.headers = headers
        self.user_id = 1
        self.course_id = 3
        # 正常测试用例
        self.data = {
            'course_id': 3,
            'price_policy_id': 3,
        }

        self.data4 = {
            'course_id': 3,
            'price_policy_id': 4,
        }

        self.data5 = {
            'course_list': [3],
        }

        # 空白测试用例
        self.data1 = {}

        self.data6 = {
            'course_list': [],
        }

        # 含有错误信息的测试用例
        self.data2 = {
            'course_id': 9999,
            'price_policy_id': 3,
        }
        self.data3 = {
            'course_id': 3,
            'price_policy_id': 9999,
        }

        self.data7 = {
            'course_list': [99],
        }

        # print("setup_class：所有用例执行之前")


    def teardown_class(self):
        print("teardown_class：所有用例结束后执行")

    # def setup_method(self):
    #     print("setup_method:  每个用例开始前执行")
    #
    # def teardown_method(self):
    #     print("teardown_method:  每个用例结束后执行")
    @staticmethod
    def is_valid(dic):
        assert isinstance(dic, dict)
        assert 'code' in dic
        assert 'data' in dic
        assert 'errors' in dic

    def test_sc_add(self):
        data = self.data
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        if StudyCourse.objects.filter(account=self.user_id, course_id=self.course_id).exists():
            assert dic['code'] == 1024
        else:
            assert dic['code'] == 1000

    def test_sc_add_1(self):
        data = self.data1
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1020

    def test_sc_add_2(self):
        data = self.data2
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1025

    def test_sc_add_3(self):
        data = self.data3
        res = requests.post(self.url, headers=self.headers,
                            data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1021

    def test_sc_list(self):
        res = requests.get(self.url, headers=self.headers)
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    def test_sc_edit(self):
        data = self.data4
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000

    def test_sc_edit_1(self):
        data = self.data1
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1020

    def test_sc_edit_2(self):
        data = self.data2
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1025

    def test_sc_edit_3(self):
        data = self.data3
        res = requests.put(self.url, headers=self.headers,
                           data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1021

    def test_sc_del(self):
        # 空白
        data = self.data6
        res = requests.delete(self.url, headers=self.headers,
                              data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1020


    def test_sc_del_1(self):
        # 错误
        data = self.data7
        res = requests.delete(self.url, headers=self.headers,
                              data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1025


    def test_sc_del_2(self):
        # 正确
        data = self.data5
        res = requests.delete(self.url, headers=self.headers,
                              data=json.dumps(data, ensure_ascii=False))
        dic = res.json()
        self.is_valid(dic)
        assert dic['code'] == 1000
        assert dic['data'] is None

    # def test_two(self):
    #     print("正在执行----test_two")
    #     x = "hello"
    #     assert hasattr(x, 'check')
    #
    # def test_three(self):
    #     print("正在执行----test_three")
    #     a = "hello"
    #     b = "hello world"
    #     assert a in b


if __name__ == "__main__":
    pytest.main(["-s -v", "test_shopping.py"])
