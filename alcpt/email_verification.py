import random
import base64

from email.mime.text import MIMEText
from smtplib import SMTP, SMTPAuthenticationError, SMTPException
from alcpt.models import User


def email_verified(verified_email):
    # strSmtp = "smtp.gmail.com:587"
    # 主機
    strAccount = "mis.alcpt.109@gmail.com"      # 備援信箱：tryitnotareal1997@gmail.com
    strPassword = "eji6z;6284vm,6"

    # encode the verified email
    email = verified_email
    email_bytes = email.encode('ascii')
    base64_bytes = base64.b64encode(email_bytes)
    base64_email = base64_bytes.decode('ascii')

    # content = "Dear ALCPT User: Your email verification code is " + str(verification_code)
    content = "http://127.0.0.1:8000/email_verification_done/" + base64_email
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
