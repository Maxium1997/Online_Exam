import json

from django.shortcuts import render
from django.http.response import HttpResponse
from django.core.exceptions import ObjectDoesNotExist
from django.contrib import messages
from django.views.decorators.http import require_http_methods
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from .models import Question, AnswerSheet, Student, User
from .exceptions import *
from .decorators import permission_check
from .definitions import UserType, QuestionType
from .managerfuncs import viewer


@permission_check(UserType.Testee)
@require_http_methods(["GET"])
def index(request):     # the homepage of 'Testee'
    answer_sheets = AnswerSheet.objects.all().filter(user_id=request.user.id)
    page = request.GET.get('page', 1)
    paginator = Paginator(answer_sheets, 5)     # the second parameter is used to display how many items. Now is display 5d

    try:
        sheets = paginator.page(page)
    except PageNotAnInteger:
        sheets = paginator.page(1)
    except EmptyPage:
        sheets = paginator.page(paginator.num_pages)

    return render(request, 'testee/index.html', locals())


# 尚未完成
@permission_check(UserType.Testee)
@require_http_methods(["GET", "POST"])
def practice_create(request, practice_type):
    if request.method == 'POST':
        pass
        return HttpResponse(request.POST.get('question_type') + ',' + request.POST.get('question_num'))
    else:
        return render(request, 'practice/create.html', locals())
