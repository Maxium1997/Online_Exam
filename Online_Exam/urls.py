"""Online_Exam URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin

from alcpt import registration, system, views, exam, question, testee

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^$', views.index, name='Homepage'),

    url(r'^accounts/', include([
        url(r'^login/', registration.login, name='login'),  # 登入
        url(r'^logout/', registration.logout, name='logout'),  # 登出
    ])),

    # 系統管理員部分
    url(r'^user/', include([
        url(r'^list$', system.user_list, name='user_list'),
        # url(r'^create$', system.create_user, name='user_create'),
        # url(r'^(?P<reg_id>[a-zA-Z0-9]+)$', system.edit_user, name='user_edit'),
        # url(r'^(?P<reg_id>[a-zA-Z0-9]+)/delete$', system.delete_user, name='delete'),

        url(r'^unit_list/$', system.unit, name='unit_list'),
        url(r'^unit_list/', include([
            url(r'^create$', system.create_unit, name='unit_create'),

            # url(r'^(?P<department_id>[0-9]+)/', include([
            #     url(r'^edit$', system.department_edit, name='department_edit'),
            #     url(r'^delete$', system.delete_department, name='department_delete'),
            # ])),
            # url(r'^(?P<squadron_name>[\w]+)/', include([
            #     url(r'^edit$', system.squadron_edit, name='squadron_edit'),
            #     url(r'^delete$', system.delete_squadron, name='squadron_delete'),
            # ])),
        ]))
    ])),

    # 受測者部分(尚未完成)
    url(r'^testee$', testee.index, name='testee_exam_score'),       # 受測者主頁（顯示自我成績）
    url(r'^testee/', include([
        url(r'^practice/', include([
            url(r'^(?P<practice_type>(listening|reading))$', testee.practice_create, name='testee_practice_selected'),
        ]))
    ])),

    # 考試管理員
    url(r'^exam$', exam.exam_list, name='exam_list'),
    url(r'^exam/', include([
        url(r'^testpaper_list', exam.testpaper_list, name='testpaper_list'),

        url(r'^testee_group$', exam.testee_group_list, name='testee_group_list'),
    ])),

    # 題庫管理員
    url(r'^question$', question.manager_index, name='tbmanager_question_list'),
]
