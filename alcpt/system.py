from string import punctuation

from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.core.exceptions import ObjectDoesNotExist
from django.contrib import messages

from alcpt.managerfuncs import systemmanager
from alcpt.models import User, Student, Department, Squadron, Proclamation
from alcpt.definitions import UserType
from alcpt.decorators import permission_check


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

    users = systemmanager.query_users(**keywords)
    departments = Department.objects.all()
    squadrons = Squadron.objects.all()
    privileges = UserType.__members__

    page = request.GET.get('page', 0)
    paginator = Paginator(users, 10)  # the second parameter is used to display how many items. Now is display 10

    try:
        userList = paginator.page(page)
    except PageNotAnInteger:
        userList = paginator.page(1)
    except EmptyPage:
        userList = paginator.page(paginator.num_pages)

    return render(request, 'user/index.html', locals())


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

