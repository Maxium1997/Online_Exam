import re
import xlrd
import os

from string import punctuation

from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.core.exceptions import ObjectDoesNotExist
from django.db import IntegrityError
from django.contrib import messages

from alcpt.managerfuncs import systemmanager
from alcpt.models import User, Student, Department, Squadron, Proclamation, ReportCategory, Report
from alcpt.definitions import UserType
from alcpt.decorators import permission_check, login_required
from alcpt.exceptions import IllegalArgumentError


# 使用者列表
@permission_check(UserType.SystemManager)
def user_list(request):
    keywords = {
        'name': request.GET.get('name')
    }

    if keywords['name'] and any(char in punctuation for char in keywords['name']):
        keywords['name'] = None
        messages.warning(request, "Name cannot contains any special character.")

    for keyword in ['department', 'grade', 'squadron']:
        try:
            keywords[keyword] = int(request.GET.get(keyword))
        except (KeyError, TypeError, ValueError):
            keywords[keyword] = None

    if keywords['department']:
        try:
            keywords['department'] = Department.objects.get(id=keywords['department'])
        except ObjectDoesNotExist:
            keywords['department'] = None

    if keywords['squadron']:
        try:
            keywords['squadron'] = Squadron.objects.get(id=keywords['squadron'])
        except ObjectDoesNotExist:
            keywords['squadron'] = None

    query_content, users = systemmanager.query_users(**keywords)
    departments = Department.objects.all()
    squadrons = Squadron.objects.all()
    privileges = UserType.__members__

    page = request.GET.get('page', 1)
    paginator = Paginator(users, 8)  # the second parameter is used to display how many items. Now is display 10

    try:
        userList = paginator.page(page)
    except PageNotAnInteger:
        userList = paginator.page(1)
    except EmptyPage:
        userList = paginator.page(paginator.num_pages)

    return render(request, 'user/index.html', locals())


# 新增使用者（單一）
@permission_check(UserType.SystemManager)
def user_create(request):
    if request.method == 'POST':
        reg_id = request.POST.get('reg_id',)

        privilege_value = 0
        i = 0
        for privilege in UserType.__members__.values():
            if privilege and request.POST.get('privilege_{}'.format(i)):
                privilege_value |= privilege.value[0]
            i += 1

        try:
            new_user = User.objects.create_user(reg_id=reg_id, privilege=privilege_value, password=reg_id)
            new_user.save()
        except IntegrityError:
            messages.error(request, "Existed user reg_id: {}".format(reg_id))
            privileges = UserType.__members__
            return render(request, 'user/create_user.html', locals())

        messages.success(request, 'Create user "{}" successful.'.format(new_user))

        return redirect('user_list')
    else:
        privileges = UserType.__members__
        return render(request, 'user/create_user.html', locals())


# 新增使用者（多重）
@permission_check(UserType.SystemManager)
def user_multiCreate(request):
    if request.method == 'POST':
        if request.POST.get('reg_ids'):
            new_accounts = []
            for account in request.POST.get('reg_ids').split(','):
                account = account.strip().lower()
                if not re.match('[a-z0-9]+', account):
                    raise IllegalArgumentError('Account can only contain letters and numbers.')

                new_accounts.append(account)

        elif request.FILES.get('users_file',):
            wb = xlrd.open_workbook(filename=None, file_contents=request.FILES['users_file'].read())
            table = wb.sheets()[0]
            new_accounts = []
            for i in range(table.nrows):
                for j in range(table.ncols):
                    if isinstance(table.cell_value(i, j), float):
                        new_accounts.append(int(table.cell_value(i, j)))

        else:
            messages.warning(request, 'Must enter textarea or load a file.')
            return redirect('user_multiCreate')

        privilege_value = 0
        if request.user.has_perm(UserType.SystemManager):
            i = 0
            for privilege in UserType.__members__.values():
                if privilege and request.POST.get('privilege_{}'.format(i)):
                    privilege_value |= privilege.value[0]
                i += 1

        else:
            privilege_value = UserType.Testee.value[0]

        new_users = systemmanager.create_users(reg_ids=new_accounts,
                                               privilege=privilege_value,)

        if privilege_value & UserType.Testee.value[0]:
            Student.objects.bulk_create([Student(stu_id=new_user.reg_id, user=new_user) for new_user in new_users])

        messages.success(request, 'Create user "{}" successful.'.format(len(new_users)))

        return redirect('user_list')

    else:
        privileges = UserType.__members__

        return render(request, 'user/multi_create_user.html', locals())


# 單位列表
@permission_check(UserType.SystemManager)
@require_http_methods(["GET"])
def unit(request):
    departments = Department.objects.all()
    squadrons = Squadron.objects.all()
    return render(request, 'user/unit_list.html', locals())


# 新增公告
@permission_check(UserType.SystemManager)
def proclamation_create(request):
    if request.method == 'POST':
        title = request.POST.get('p_title')
        text = request.POST.get('p_text')
        Proclamation.objects.create(title=title, text=text, is_public=True, created_by=request.user)

        return redirect('/')
    else:
        return render(request, 'proclamation_create.html', locals())


# 公告內容
def proclamation_detail(request, proclamation_id):
    try:
        proclamation = Proclamation.objects.get(id=proclamation_id)
        return render(request, 'proclamation_detail.html', locals())
    except ObjectDoesNotExist:
        messages.error(request, 'Proclamation doesn\'t exist, proclamation id: {}'.format(proclamation_id))
        return redirect('/')


# 刪除公告
@permission_check(UserType.SystemManager)
def proclamation_delete(request, proclamation_id):
    try:
        proclamation = Proclamation.objects.get(id=proclamation_id)
        proclamation.delete()
        messages.success(request, 'Delete proclamation successfully, proclamation title: {}.'.format(proclamation.title))
    except ObjectDoesNotExist:
        messages.error(request, 'Proclamation doesn\'t exist, proclamation id: {}'.format(proclamation_id))

    return redirect('/')


# 編輯公告
@permission_check(UserType.SystemManager)
def proclamation_edit(request, proclamation_id):
    try:
        proclamation = Proclamation.objects.get(id=proclamation_id)
    except ObjectDoesNotExist:
        messages.error(request, 'Proclamation doesn\'t exist, proclamation id: {}'.format(proclamation_id))
        return redirect('/')

    if request.method == 'POST':
        proclamation.title = request.POST.get('proclamation_title',)
        proclamation.text = request.POST.get('proclamation_text',)
        messages.success(request, 'Update Successfully. proclamation title: {}'.format(proclamation.title))
        return redirect('/')
    else:
        return render(request, 'proclamation_edit.html', locals())


# 新增單位（學系、中隊）
@permission_check(UserType.SystemManager)
@require_http_methods(["GET", "POST"])
def create_unit(request):
    name = request.POST.get('unit_name')

    if request.method == 'POST':
        if request.POST.get('unit') == 'department':
            Department.objects.create(name=name)

        elif request.POST.get('unit') == 'squadron':
            Squadron.objects.create(name=name)

        else:
            messages.error(request, 'Choose the unit which you want to create.')
            return redirect('unit_create')

        messages.success(request, 'Success insert new unit: {}.'.format(name))

        return redirect('unit_list')

    else:
        return render(request, 'user/create_unit.html')


# 顯示單位人員
@permission_check(UserType.SystemManager)
def unit_member_list(request, unit_kind, unit_name):
    if unit_kind == 'squadron':
        try:
            unit = Squadron.objects.get(name=unit_name)
            unit_members = unit.student_set.all()
            return render(request, 'user/unit_member_list.html', locals())
        except ObjectDoesNotExist:
            messages.error(request, "Squadron doesn't exist, squadron name: {}".format(unit_name))
    elif unit_kind == 'department':
        try:
            unit = Department.objects.get(name=unit_name)
            unit_members = unit.student_set.all()
            return render(request, 'user/unit_member_list.html', locals())
        except ObjectDoesNotExist:
            messages.error(request, "Department doesn't exist, department name: {}".format(unit_name))
    else:
        messages.warning(request, "Unit kind doesn't exist, unit kind: {}".format(unit_kind))

    return redirect('unit_list')


# 回報類別列表
@permission_check(UserType.SystemManager)
def report_category_list(request):
    report_categories = ReportCategory.objects.all()
    privileges = UserType.__members__
    return render(request, 'user/report_category_list.html', locals())


# 新增回報類別
@permission_check(UserType.SystemManager)
def report_category_create(request):
    if request.method == 'POST':
        category_name = request.POST.get('category_name',)

        responsibility_value = 0
        i = 0
        for privilege in UserType.__members__.values():
            if privilege and request.POST.get('privilege_{}'.format(i)):
                responsibility_value |= privilege.value[0]
            i += 1

        try:
            new_category = ReportCategory.objects.create(name=category_name,
                                                         responsibility=responsibility_value)
            new_category.save()
        except IntegrityError:
            messages.error(request, "Existed category name: {}".format(category_name))
            privileges = UserType.__members__
            return render(request, 'user/create_user.html', locals())

        messages.success(request, 'Create report category "{}" successful.'.format(new_category))

        return redirect('report_category_list')
    else:
        privileges = UserType.__members__
        return render(request, 'user/create_report_category.html', locals())


@login_required
def report(request):
    if request.method == 'POST':
        try:
            category = ReportCategory.objects.get(id=int(request.POST.get('category',)))

        except ObjectDoesNotExist:
            messages.error(request, 'Category does not exist, category name: {}'.format(category))
            categories = ReportCategory.objects.all()
            return render(request, 'report.html', locals())

        supplement_note = request.POST.get('supplement_note',)

        user_report = Report.objects.create(category=category, supplement_note=supplement_note,
                                            created_by=request.user, state=1)

        user_report.save()

        messages.success(request, 'Thanks for your advise, we will help you to solve your problem as soon as possible.')

        return redirect('Homepage')
    else:
        categories = ReportCategory.objects.all()
        return render(request, 'report.html', locals())


@permission_check(UserType.SystemManager)
def report_category_detail(request, category_id):
    try:
        category = ReportCategory.objects.get(id=category_id)
        return render(request, 'user/report_category_detail.html', locals())
    except ObjectDoesNotExist:
        messages.error(request, 'Report Category does not exist, report category id: {}'.format(category_id))
        return redirect('report_category_list')
