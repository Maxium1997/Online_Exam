from string import punctuation

from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from django.views.decorators.http import require_http_methods

from .models import Question
from .exceptions import *
from .decorators import permission_check
from .definitions import UserType, QuestionType
from .managerfuncs import tbmanager


# @permission_check(UserType.TBManager)
@require_http_methods(["GET"])
def manager_index(request):
    question_types = []
    for q in list(QuestionType):
        question_types.append(q)

    state_choices = (
        (0, '暫存'),
        (1, '審核通過'),
        (2, '審核未通過'),
        (3, '等待審核'),
        (4, '被回報錯誤'),
        (5, '被回報錯誤，已處理'),
    )

    q_type = request.GET.get('question_type',)
    q_content = request.GET.get('question_content',)
    difficulty = request.GET.get('difficulty',)
    state = request.GET.get('state',)

    questions = Question.objects.all()
    page = request.GET.get('page', 0)
    paginator = Paginator(questions, 10)  # the second parameter is used to display how many items. Now is display 10

    try:
        questionList = paginator.page(page)
    except PageNotAnInteger:
        questionList = paginator.page(1)
    except EmptyPage:
        questionList = paginator.page(paginator.num_pages)

    return render(request, 'question/question_list.html', locals())
