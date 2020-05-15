from django.shortcuts import render, HttpResponse, redirect
from django.contrib import auth
from django.http import JsonResponse
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from bs4 import BeautifulSoup
from geetest import GeetestLib

from luffy_rest_pro import settings

# Create your views here.
