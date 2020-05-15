#!usr/bin/env python
# -*- coding:utf-8 -*-
from django import forms
from django.forms import widgets
from django.core.exceptions import ValidationError
from django.utils.module_loading import import_string

from django.conf import settings
from teacher.models import HomeworkRecord


class HomeworkRecordForm(forms.ModelForm):

    class Meta:
        model = HomeworkRecord
        fields = ['file']


