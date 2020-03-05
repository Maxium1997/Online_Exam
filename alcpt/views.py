from django.shortcuts import render
from django.http import FileResponse

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

from .definitions import UserType
from .models import Proclamation, User, AnswerSheet, Exam

# Create your views here.


def index(request):
    privileges = UserType.__members__,
    proclamations = Proclamation.objects.filter(is_public=True)
    page = request.GET.get('page', 1)
    paginator = Paginator(proclamations, 5)  # the second parameter is used to display how many items. Now is display 5

    try:
        pros = paginator.page(page)
    except PageNotAnInteger:
        pros = paginator.page(1)
    except EmptyPage:
        pros = paginator.page(paginator.num_pages)

    return render(request, 'proclamation.html', locals())


def about(request):
    testees = [testee.answersheet_set.count for testee in User.objects.all()]

    return render(request, 'SystemDocument/About.html', locals())


def downloadSystemPDF(request):
    file = open('./static/document/project.pdf', 'rb')  # path have to start from root
    response = FileResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="project.pdf"'
    return response


def about_developer(request):
    return render(request, 'SystemDocument/developer.html')


def about_SystemManager(request):
    return render(request, 'SystemDocument/About_SystemManager.html')


def about_TestManager(request):
    return render(request, 'SystemDocument/About_TestManager.html')


def about_TBManager(request):
    return render(request, 'SystemDocument/About_TBManager.html')


def about_TBOperator(request):
    return render(request, 'SystemDocument/About_TBOperator.html')


def about_Viewer(request):
    return render(request, 'SystemDocument/About_Viewer.html')


def about_Testee(request):
    return render(request, 'SystemDocument/About_Testee.html')
