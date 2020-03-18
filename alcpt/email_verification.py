import random
import base64

from email.mime.text import MIMEText
from smtplib import SMTP, SMTPAuthenticationError, SMTPException
from alcpt.models import User
from alcpt.proclamation import *


def email_verified(verified_user, verified_email, request_user):
    # strSmtp = "smtp.gmail.com:587"
    # 主機
    strAccount = "mis.alcpt.109@gmail.com"      # 備援信箱：tryitnotareal1997@gmail.com
    strPassword = "eji6z;6284vm,6"

    # encode the verified email
    email = verified_email
    email_bytes = email.encode('ascii')
    base64_bytes = base64.b64encode(email_bytes)
    base64_email = base64_bytes.decode('ascii')

    content = "Hey, " + verified_user.reg_id + "！\n\n" + \
              "Welcome to use ALCPT Online-Practice Platform. You had modified your email.\n" + \
              "Please click on the following URL to complete the email verification process: \n\n" + \
              "http://127.0.0.1:8000/email_verification_done/" + base64_email + "\n\n" + \
              "This is an automatic notification mail from the system. Please did not reply directly.\n" + \
              "Thank you for your cooperation."

    proclamation_content = "Please check out your email to complete the email verification.\n\n" + \
                           "Thank you for your cooperation."
    Proclamation.objects.create(title="Email Verification",
                                text=proclamation_content,
                                is_read=False,
                                is_public=False,
                                created_by=request_user,
                                recipient=verified_user)

    msg = MIMEText(content)
    msg["Subject"] = "ALCPT Email Verification"
    # 郵件標題
    mail_to = verified_email

    server = SMTP("smtp.gmail.com:587")
    # server = SMTP(strSmtp)
    # 建立連線
    server.ehlo()
    # 跟主機溝通
    server.starttls()
    # TTLS安全驗證

    try:
        server.login(strAccount, strPassword)
        server.sendmail(strAccount, mail_to, msg.as_string())
        hint = "郵件已發送"
    except SMTPAuthenticationError:
        hint = "無法登入"
    except:
        hint = "郵件發送產生錯誤"
    server.quit()
    # 關閉連線


def reset_password_mail(reg_id, email):
    strAccount = "mis.alcpt.109@gmail.com"
    strPassword = "eji6z;6284vm,6"

    reg_id = reg_id
    reg_id_bytes = reg_id.encode('ascii')
    base64_bytes = base64.b64encode(reg_id_bytes)
    base64_reg_id = base64_bytes.decode('ascii')

    content = "http://127.0.0.1:8000/accounts/password/reset/" + base64_reg_id
    msg = MIMEText(content)
    msg["Subject"] = "ALCPT Reset Password"
    mail_to = email

    server = SMTP("smtp.gmail.com:587")
    server.ehlo()
    server.starttls()

    try:
        server.login(strAccount, strPassword)
        server.sendmail(strAccount, mail_to, msg.as_string())
        hint = "郵件已發送"
    except SMTPAuthenticationError:
        hint = "無法登入"
    except:
        hint = "郵件發送產生錯誤"
    server.quit()
