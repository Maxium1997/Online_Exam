from django.shortcuts import render, redirect

from django.utils import timezone
from django.contrib import auth
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from django.core.exceptions import ObjectDoesNotExist

from Online_Exam.settings import LOGIN_REDIRECT_URL
from alcpt.definitions import UserType
from alcpt.forms import CaptchaForm

# Create your views here.


# 登入
def login(request):
    if request.method == 'POST':
        captcha = CaptchaForm(request.POST)
        if captcha.is_valid(): #驗證通過
            reg_id = request.POST.get('reg_id', '')
            password = request.POST.get('password', '')
            next_page = request.GET.get('next', LOGIN_REDIRECT_URL)

            try:

                user = auth.authenticate(reg_id=reg_id, password=password)

                if user is None or not user.is_active:
                    messages.error(request, 'Wrong Password or User unexist.')
                    return redirect('login')

                auth.login(request, user)
                user.update_time = timezone.now()
                user.save()
                messages.success(request, 'Login Success.')

            except ObjectDoesNotExist:
                return redirect('login')

            return redirect(next_page)
        else:
            messages.error(request, '驗證碼錯誤')
            return redirect('login')

    else:
        captcha = CaptchaForm()
        if request.user.is_authenticated():
            return redirect('/')

        else:
            return render(request, 'registration/login.html', locals())


# 登出
@login_required
def logout(request):
    auth.logout(request)

    return redirect('Homepage')


# 檢視個人資料
@login_required
def profile(request):
    user = request.user
    privileges = UserType.__members__
    return render(request, 'registration/profile.html', locals())


