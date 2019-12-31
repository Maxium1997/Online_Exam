import re

from django.shortcuts import render, redirect

from django.utils import timezone
from django.contrib import auth
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from django.core.exceptions import ObjectDoesNotExist

from Online_Exam.settings import LOGIN_REDIRECT_URL
from alcpt.definitions import UserType
from alcpt.forms import CaptchaForm
from alcpt.models import User, Student, Department, Squadron
from alcpt.email_verification import email_verified

# Create your views here.


# 登入
def login(request):
    if request.method == 'POST':
        captcha = CaptchaForm(request.POST)
        if captcha.is_valid():  # 驗證通過
            reg_id = request.POST.get('reg_id', '')
            password = request.POST.get('password', '')
            next_page = request.GET.get('next', LOGIN_REDIRECT_URL)

            try:
                user = auth.authenticate(reg_id=reg_id, password=password)

                if user is None or not user.is_active:
                    messages.error(request, 'Wrong Password or User unexist.')
                    return redirect('login')

                auth.login(request, user)
                if request.user.email is "":
                    departments = Department.objects.all()
                    squadrons = Squadron.objects.all()
                    messages.warning(request, 'Fist login, please edit your data')
                    return render(request, 'registration/edit_profile.html', locals())
                # user.last_login = timezone.now()
                # user.save()
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
    messages.success(request, 'Logout Success.')

    return redirect('Homepage')


# 檢視個人資料
@login_required
def profile(request):
    user = request.user
    privileges = UserType.__members__
    return render(request, 'registration/profile.html', locals())


# 編輯個人資料
@login_required
def edit_profile(request, reg_id):
    try:
        user = User.objects.get(reg_id=reg_id)
    except ObjectDoesNotExist:
        messages.error(request, 'User does not exist, user id: {}'.format(reg_id))

    if request.method == 'POST':
        user.name = request.POST.get('name',)
        user.gender = int(request.POST.get('gender',))
        user.save()

        email = request.POST.get('email',)
        if not re.match("[^@]+@[^@]+\.[^@]+", email):
            messages.warning(request, "email doesn't match regular expression.")
            departments = Department.objects.all()
            squadrons = Squadron.objects.all()
            return render(request, 'registration/edit_profile.html', locals())
        else:
            if email == user.email:
                pass
            else:
                user.email = email
                user.email_is_verified = False
                messages.warning(request, 'Your have to verify email again.')
                user.save()

        try:
            student = user.student
            student.grade = int(request.POST.get('grade',))
            student.department = Department.objects.get(id=int(request.POST.get('department',)))
            student.squadron = Squadron.objects.get(id=int(request.POST.get('squadron',)))
            student.save()
        except ObjectDoesNotExist:
            pass

        messages.success(request, 'Saved profile successfully.')
        return redirect('profile')

    else:
        privileges = UserType.__members__
        departments = Department.objects.all()
        squadrons = Squadron.objects.all()
        return render(request, 'registration/edit_profile.html', locals())


# 更改密碼
@login_required
def change_password(request):
    if request.method == 'POST':
        user = request.user
        old_password = request.POST.get('old_password',)

        if user.check_password(old_password):
            pass
        else:
            messages.error(request, 'Old password does not match.')
            return redirect('password_change')

        new_password = request.POST.get('new_password',)
        verification_password = request.POST.get('verification_password',)

        if new_password == old_password:
            messages.error(request, 'New password and old password are the same.')
            return redirect('password_change')
        elif new_password != verification_password:
            messages.error(request, 'Verification error.')
            return redirect('password_change')
        else:
            user.set_password(new_password)
            user.update_time = timezone.now()
            user.save()

            messages.success(request, 'Password change successfully. Please login again with new password.')
            return redirect('profile')
    else:
        return render(request, 'registration/password_change.html', locals())


def reset_password(request):
    if request.method == 'POST':
        new_password = request.POST.get('new_password', )
        verification_password = request.POST.get('verification_password', )
        if new_password != verification_password:
            messages.error(request, 'Verification error.')
            return redirect('password_reset')
        else:
            messages.warning(request, request.AnonymousUser())
            return redirect('password_reset')

            # messages.success(request, 'Password change successfully. Please login again with new password.')
            # return redirect('login')
    else:
        return redirect('password_reset')


# @login_required
def verification(request):
    if request.method == 'POST':
        if int(request.POST.get('random_code',)) == int(request.POST.get('verification_code',)):
            messages.success(request, 'Email Verified successfully.')

            if request.POST.get('forget_change_pwd',):
                return render(request, 'registration/password_reset.html', locals())

            request.user.email_is_verified = True
            request.user.save()
            return redirect('profile')
        else:
            departments = Department.objects.all()
            squadrons = Squadron.objects.all()
            info = 'Email Verified Failed, check your email.' + str(request.POST.get('random_code',))
            messages.warning(request, info)
            return render(request, 'registration/edit_profile.html', locals())
    else:
        random_code = email_verified(request.user)
        return render(request, 'email_verification.html', locals())


def forget_password(request):
    if request.method == 'POST':
        try:
            user = User.objects.get(reg_id=request.POST.get('reg_id',))
            if user.email_is_verified:
                random_code = email_verified(user)
                flag = int(request.POST.get('forget_change_pwd',))
                messages.success(request, 'Please check your email.')
                return render(request, 'email_verification.html', locals())
            else:
                messages.error(request, 'Your email does not verify.')
                return redirect('password_forget')
        except ObjectDoesNotExist:
            messages.error(request, 'User does not exist, user id: {}'.format(request.POST.get('reg_id',)))
            return redirect('password_forget')
    else:
        return render(request, 'registration/check_id.html', locals())
