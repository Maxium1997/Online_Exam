from string import punctuation

from django.shortcuts import render, redirect

from django.views.decorators.http import require_http_methods
from django.contrib import messages
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from alcpt.managerfuncs import testmanager
from alcpt.decorators import permission_check
from alcpt.definitions import UserType, QuestionTypeCounts
from alcpt.models import Exam, TestPaper, Group


@permission_check(UserType.TestManager)
@require_http_methods(["GET"])
def exam_list(request):
    exam_name = request.GET.get('exam_name')

    if exam_name:
        exams = Exam.objects.filter(is_public=True).filter(name__contains=exam_name)
    else:
        exams = Exam.objects.filter(is_public=True)

    page = request.GET.get('page', 0)
    paginator = Paginator(exams, 10)  # the second parameter is used to display how many items. Now is display 10

    try:
        examList = paginator.page(page)
    except PageNotAnInteger:
        examList = paginator.page(1)
    except EmptyPage:
        examList = paginator.page(paginator.num_pages)

    return render(request, 'exam/exam_list.html', locals())


@permission_check(UserType.TestManager)
@require_http_methods(["GET"])
def testpaper_list(request):
    testpaper_name = request.GET.get('testpaper_name')

    if testpaper_name:
        testpapers = TestPaper.objects.filter(is_testpaper=True).filter(name__contains=testpaper_name)
    else:
        testpapers = TestPaper.objects.filter(is_testpaper=True)

    page = request.GET.get('page', 0)
    paginator = Paginator(testpapers, 10)  # the second parameter is used to display how many items. Now is display 10

    try:
        testpaperList = paginator.page(page)
    except PageNotAnInteger:
        testpaperList = paginator.page(1)
    except EmptyPage:
        testpaperList = paginator.page(paginator.num_pages)

    return render(request, 'exam/testpaper_list.html', locals())


@permission_check(UserType.TestManager)
def testpaper_create(request):
    if request.method == 'POST':
        testpaper_name = request.POST.get('testpaper_name',)

        try:
            if TestPaper.objects.filter(name__icontains=testpaper_name):
                raise MultipleObjectsReturned('Question has existed.')
        except ObjectDoesNotExist:
            pass

        testpaper = testmanager.create_testpaper(name=testpaper_name, created_by=request.user, is_testpaper=1)

        return render(request, 'exam/testpaper_edit.html', locals())

    else:
        return render(request, 'exam/testpaper_create.html', locals())


# # 編輯考卷，還沒寫完
# @permission_check(UserType.TestManager)
# def testpaper_edit(request, testpaper_id):
#     try:
#         testpaper = TestPaper.objects.get(id=testpaper_id)
#     except ObjectDoesNotExist:
#         messages.error(request, 'Testpaper does not exist, testpaper id: {}'.format(testpaper_id))
#         return redirect('testpaper_list')
#
#     if testpaper.valid == 1:
#         messages.warning(request, "This testpaper is valid, it can't not edit again.")
#         return redirect('testpaper_list')
#
#     if request.method == "POST":
#         testpaper_name = request.POST.get('testpaper_name',)
#
#         testpaper = testmanager.edit_testpaper(testpaper, testpaper_name)
#
#         testpaper.valid = testpaper.question_set.count() == sum(QuestionTypeCounts.Exam.value[0])
#
#         testpaper.save()
#
#         messages.success(request, 'Successfully update testpaper: testpaper id: {}'.format(testpaper.id))
#
#         return redirect('testpaper_list')
#
#     else:


# 人工選題
# @permission_check(UserType.TestManager)
# def manual_pick(request):


# 自動選題
# @permission_check(UserType.TestManager)
# def auto_pick(request):



@permission_check(UserType.TestManager)
@require_http_methods(["GET"])
def testee_group_list(request):
    group_name = request.GET.get('group_name')

    if group_name:
        groups = Group.objects.filter(name__contains=group_name)
    else:
        groups = Group.objects.all()

    page = request.GET.get('page', 0)
    paginator = Paginator(groups, 10)

    try:
        groupList = paginator.page(page)
    except PageNotAnInteger:
        groupList = paginator.page(1)
    except EmptyPage:
        groupList = paginator.page(paginator.num_pages)

    return render(request, 'exam/testee_group_list.html', locals())

