from string import punctuation
from datetime import datetime, timedelta

from django.shortcuts import render, redirect

from django.views.decorators.http import require_http_methods
from django.contrib import messages
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db import IntegrityError

from alcpt.managerfuncs import testmanager
from alcpt.decorators import permission_check
from alcpt.definitions import UserType, QuestionType, QuestionTypeCounts, ExamType
from alcpt.models import Exam, TestPaper, Group, Question, Proclamation
from alcpt.exceptions import *


@permission_check(UserType.TestManager)
@require_http_methods(["GET"])
def exam_list(request):
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
def exam_create(request):
    if request.method == 'POST':
        date = request.POST.get('start_time_date')
        hour = request.POST.get('start_time_hour')
        minute = request.POST.get('start_time_minute')
        start_time = date + " " + hour + ":" + minute
        duration = request.POST.get('duration')
        started_time = datetime.strptime(str(start_time), '%Y-%m-%d %H:%M')
        finish_time = datetime.strptime(str(start_time), '%Y-%m-%d %H:%M') + timedelta(minutes=int(duration))

        testpaper = TestPaper.objects.get(id=int(request.POST.get('selected_testpaper',)))
        selected_group = Group.objects.get(id=int(request.POST.get('selected_group')))

        exam_name = request.POST.get('exam_name',)
        try:
            exam = Exam.objects.create(name=exam_name,
                                       exam_type=ExamType.Exam.value[0],
                                       start_time=start_time,
                                       created_time=datetime.now(),
                                       duration=duration,
                                       finish_time=finish_time,
                                       testpaper=testpaper,
                                       is_public=True,
                                       created_by=request.user)
            testpaper.is_used = True
            testpaper.save()

            # add the testee into the exam.
            for testee in selected_group.member.all():
                exam.testeeList.add(testee)
            exam.save()

            # create proclamation to notice all user the exam start time.
            pro_content = "Exam name: " + exam.name + "\n" + \
                          "Start Time: " + exam.start_time + "\n" + \
                          "Duration: " + exam.duration + " min"
            proclamation = Proclamation.objects.create(title=exam.name,
                                                       text=pro_content,
                                                       is_public=True,
                                                       created_by=request.user)

            messages.success(request, "Successfully created a new exam - %s.".format(exam.name))
        except IntegrityError:
            raise IntegrityError("Duplicate entry '%s' for key 'name'".format(exam_name))

        return redirect('exam_list')
    else:
        exam_names = [_.name for _ in Exam.objects.all()]
        testpapers = TestPaper.objects.filter(is_testpaper=True, valid=True)
        groups = Group.objects.all()

        dateList = []
        now_date = datetime.now().strftime('%Y-%m-%d')
        dateList.append(now_date)
        for i in range(20):
            now_date = datetime.strptime(now_date, '%Y-%m-%d')
            now_date = now_date + timedelta(days=1)
            now_date = now_date.strftime('%Y-%m-%d')
            dateList.append(now_date)

        hourList = []
        for i in range(24):
            hourList.append(i)

        minuteList = [0]
        for i in range(1, 60):
            if i % 5 == 0:
                minuteList.append(i)

        return render(request, 'exam/exam_create.html', locals())


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
def testpaper_content(request, testpaper_id):
    try:
        testpaper = TestPaper.objects.get(id=testpaper_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Test paper does not exist, test paper id: %s'.format(testpaper_id))
        return redirect('testpaper_list')

    questions = testpaper.question_list.all().order_by('q_type')

    return render(request, 'exam/testpaper_content.html', locals())


@permission_check(UserType.TestManager)
def testpaper_create(request):
    if request.method == 'POST':
        testpaper_name = request.POST.get('testpaper_name',)

        try:
            testpaper = testmanager.create_testpaper(name=testpaper_name, created_by=request.user, is_testpaper=1)
            messages.success(request, 'Successfully created test paper - %s'.format(testpaper.name))
            return redirect('testpaper_edit', testpaper_id=testpaper.id)
            
        except:
            messages.error(request, "This name had existed.")
            testpaper_names = [_.name for _ in TestPaper.objects.all()]
            return render(request, 'exam/testpaper_create.html', locals())

    else:
        testpaper_names = [_.name for _ in TestPaper.objects.all()]
        return render(request, 'exam/testpaper_create.html', locals())


# 編輯考卷（未完成）
@permission_check(UserType.TestManager)
def testpaper_edit(request, testpaper_id):
    try:
        testpaper = TestPaper.objects.get(id=testpaper_id)

        if testpaper.valid:
            messages.warning(request, "This test paper is valid, cannot edit again.")
            return redirect('testpaper_list')
        else:
            pass

    except ObjectDoesNotExist:
        messages.error(request, 'Test paper does not exist, test paper id: %s'.format(testpaper_id))
        return redirect('testpaper_list')

    if request.method == "POST":
        try:
            testpaper.name = request.POST.get('testpaper_name')
            if testmanager.quantity_confirmation(testpaper):
                testpaper.valid = True
            testpaper.save()
            messages.success(request, "Successfully edited.")

        except IntegrityError:
            messages.warning(request, "This name has existed.")

        return redirect('testpaper_list')

    else:
        question_types = list(QuestionType.__members__.values())        # 5 types of question in definition
        question_type_counts = list(QuestionTypeCounts.Exam.value[0])   # Each type has been defined its question amount

        all_selected_questions = testpaper.question_list.all()       # Had been selected questions in this test paper.
        selected_question_type_nums = [len(all_selected_questions.filter(q_type=1)),    # The number that had been selected for each type.
                                       len(all_selected_questions.filter(q_type=2)),
                                       len(all_selected_questions.filter(q_type=3)),
                                       len(all_selected_questions.filter(q_type=4)),
                                       len(all_selected_questions.filter(q_type=5))]

        testpaper_data = zip(question_types, question_type_counts, selected_question_type_nums)

        return render(request, 'exam/testpaper_edit.html', locals())


# 刪除考卷
@permission_check(UserType.TestManager)
def testpaper_delete(request, testpaper_id):
    try:
        testpaper = TestPaper.objects.get(id=testpaper_id)
        if testpaper.is_testpaper and testpaper.valid:
            messages.warning(request, 'Failed deleted test paper - %s.'.format(testpaper.id))
        else:
            messages.success(request, 'Successfully deleted test paper - %s.'.format(testpaper.id))
            testpaper.delete()
        return redirect('testpaper_list')

    except ObjectDoesNotExist:
        messages.error(request, 'Test paper does not exist, test paper id - %s'.format(testpaper_id))
        return redirect('testpaper_list')


# 人工選題（已完成）
@permission_check(UserType.TestManager)
def manual_pick(request, testpaper_id, question_type):
    try:
        testpaper = TestPaper.objects.get(id=testpaper_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Test paper does not exist, test paper id - %s'.format(testpaper_id))

    if request.method == "POST":
        selected_question_ids = request.POST.getlist('question')

        selected_questions = []
        for questionID in selected_question_ids:
            selected_questions.append(Question.objects.get(id=questionID))

        for question in selected_questions:
            testpaper.question_list.add(question)

        for question in testpaper.question_list.all().filter(q_type=question_type):
            if question not in selected_questions:
                testpaper.question_list.remove(question)

        messages.success(request, "Successfully picked.")
        return redirect('testpaper_edit', testpaper_id=testpaper.id)

    else:
        for q_type in QuestionType.__members__.values():
            if q_type.value[0] == int(question_type):
                question_type = q_type
                break

        all_questions = Question.objects.filter(state=1).filter(q_type=question_type.value[0])
        selected_questions = testpaper.question_list.filter(q_type=question_type.value[0])

        return render(request, 'exam/manual_pick.html', locals())


# 自動選題（已完成）
@permission_check(UserType.TestManager)
def auto_pick(request, testpaper_id, question_type):
    try:
        testpaper = TestPaper.objects.get(id=testpaper_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Test paper does not exist, test paper id - %s'.format(testpaper_id))

    if testmanager.quantity_confirmation(testpaper=testpaper):
        messages.warning(request, 'This type had reached limit amount.')
        return redirect('/exam/testpaper/{}/edit'.format(testpaper_id))

    selected_num = testmanager.auto_pick(testpaper=testpaper, question_type=int(question_type))

    messages.success(request, selected_num)

    return redirect('/exam/testpaper/{}/edit'.format(testpaper_id))
