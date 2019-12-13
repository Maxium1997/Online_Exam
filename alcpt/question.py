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
from .managerfuncs import tbmanager, tboperator


@permission_check(UserType.TBManager)
@require_http_methods(["GET"])
def manager_index(request):
    question_types = []
    for q in list(QuestionType):
        question_types.append(q)

    state_choices = [(1, '審核通過'),
                     (2, '審核未通過'),
                     (3, '等待審核'),
                     (4, '被回報錯誤'),
                     (5, '被回報錯誤，已處理')]
    difficulty_choices = [(1, '1'),
                          (2, '2'),
                          (3, '3'),
                          (4, '4')]

    keywords = {
        'question_content': request.GET.get('question_content',)
    }
    if keywords['question_content'] and any(char in punctuation for char in keywords['question_content']):
        keywords['question_content'] = None
        messages.warning(request, "Name cannot contains any special character.")
    for keyword in ['question_type', 'difficulty', 'state']:
        try:
            keywords[keyword] = int(request.GET.get(keyword))
        except (KeyError, TypeError, ValueError):
            keywords[keyword] = None

    q_type = request.GET.get('question_type',)
    difficulty = request.GET.get('difficulty',)
    state = request.GET.get('state',)

    questions = tbmanager.query_questions(**keywords)
    page = request.GET.get('page', 0)
    paginator = Paginator(questions, 10)  # the second parameter is used to display how many items. Now is display 10

    try:
        questionList = paginator.page(page)
    except PageNotAnInteger:
        questionList = paginator.page(1)
    except EmptyPage:
        questionList = paginator.page(paginator.num_pages)

    return render(request, 'question/question_list.html', locals())


@permission_check(UserType.TBManager)
@require_http_methods(["GET"])
def review(request):
    reviewed_questions = Question.objects.exclude(state=0).exclude(state=1).exclude(state=2).exclude(state=5)    # 過濾掉狀態為"暫存"、"審核通過"、"被回報錯誤，已處理"
    page = request.GET.get('page', 0)
    paginator = Paginator(reviewed_questions, 10)  # the second parameter is used to display how many items. Now is 10

    try:
        questionList = paginator.page(page)
    except PageNotAnInteger:
        questionList = paginator.page(1)
    except EmptyPage:
        questionList = paginator.page(paginator.num_pages)

    return render(request, 'question/review.html', locals())


@permission_check(UserType.TBManager)
def question_pass(request, question_id):
    try:
        question = Question.objects.get(id=question_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Question does not exist, question id: {}'.format(question_id))

    question.state = 1
    question.save()

    return redirect('question_review')


@permission_check(UserType.TBManager)
def question_reject(request, question_id):
    try:
        question = Question.objects.get(id=question_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Question does not exist, question id: {}'.format(question_id))

    if request.method == "POST":
        question.faulted_reason = request.POST.get('reason')
        question.state = 2
        question.save()
        return redirect('question_review')
    else:
        return render(request, 'question/reject_reason.html', locals())


@permission_check(UserType.TBManager)
def question_edit(request, question_id):
    try:
        question = Question.objects.get(id=question_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Question does not exist, question id: {}'.format(question_id))

    if request.method == 'POST':
        question.q_content = request.POST.get('q_content',)
    else:
        return render(request, 'question/question_edit.html', locals())


# 以下為「題目操作員」
@permission_check(UserType.TBOperator)
@require_http_methods(["GET"])
def operator_index(request):
    question_types = []
    for q in list(QuestionType):
        question_types.append(q)

    state_choices = [(0, '暫存'),
                     (2, '審核未通過'),
                     (4, '被回報錯誤')]

    keywords = {
        'question_content': request.GET.get('question_content', )
    }
    if keywords['question_content'] and any(char in punctuation for char in keywords['question_content']):
        keywords['question_content'] = None
        messages.warning(request, "Name cannot contains any special character.")
    for keyword in ['question_type', 'difficulty', 'state']:
        try:
            keywords[keyword] = int(request.GET.get(keyword))
        except (KeyError, TypeError, ValueError):
            keywords[keyword] = None

    q_type = request.GET.get('question_type', )
    state = request.GET.get('state', )

    questions = tboperator.query_questions(**keywords)
    page = request.GET.get('page', 0)
    paginator = Paginator(questions,
                          10)  # the second parameter is used to display how many items. Now is display 10

    try:
        questionList = paginator.page(page)
    except PageNotAnInteger:
        questionList = paginator.page(1)
    except EmptyPage:
        questionList = paginator.page(paginator.num_pages)

    return render(request, 'question/question_list.html', locals())


# 將題目狀態從"暫存"轉換成"等待審核", 目前只能一次送出一題
@permission_check(UserType.TBOperator)
@require_http_methods(["GET"])
def question_submit(request, question_id):
    try:
        question = Question.objects.get(id=question_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Question doesn\'t exist, question id: {}'.format(question_id))

    question.state = 3      # 將狀態從 0 轉 3 , 從"暫存"轉"等待審核"
    question.save()

    return redirect('tboperator_question_list')

