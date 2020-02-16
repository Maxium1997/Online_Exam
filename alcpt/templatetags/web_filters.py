from django import template

from django.core.exceptions import ObjectDoesNotExist

from alcpt.definitions import UserType, QuestionType, ExamType
from alcpt.models import User, Student, Question, ReportCategory, Exam
from alcpt.utility import set_query_parameter
from alcpt.exceptions import IllegalArgumentError, ObjectNotFoundError

register = template.Library()


# Returns True if the user has the specified permission, where perm is in the format "<app label>.<permission codename>"
@register.filter(name='has_perm')
def has_perm(user: User, required_privilege: UserType):
    return user.has_perm(UserType[required_privilege])


# Returns True if the user has the specified permission, where perm is in the format "<app label>.<permission codename>"
@register.filter(name='has_perms')
def has_perms(user: User, required_privilege: UserType):
    return user.has_perm(required_privilege)


@register.filter(name='has_permission')
def has_permission(user: User, privilege: UserType):
    return user.privilege & privilege.value[0] > 0


# check whether question_type is readable question_type
@register.filter(name='readable_question_type')
def readable_question_type(question_type: int):
    for q in QuestionType.__members__.values():
        if question_type is q.value[0]:
            return q.value[1]
    else:
        raise IllegalArgumentError(message='Unknown question type {}.'.format(question_type))


# check whether user_type is readable user_type(int or str)
@register.filter(name='readable_privilege')
def readable_user_type(privilege):
    if type(privilege) is str:
        for u_type in UserType.__members__.values():
            if u_type.name == privilege:
                return u_type.value[1]
    elif type(privilege) is int:
        for u_type in UserType.__members__.values():
            if u_type is UserType.Admin:
                if privilege is UserType.SystemManager.value[0]:
                    return UserType.SystemManager.value[1]
            elif (privilege & u_type.value[0]) > 0:
                return u_type.value[1]
        else:
            raise IllegalArgumentError(message='Unknown user type {}.'.format(privilege))
    else:
        raise IllegalArgumentError(message='Unknown user type argument which type is {}'.format(type(privilege)))


# check whether exam_type is readable type
@register.filter(name='readable_exam_type')
def readable_state(exam_type: int):
    for et in ExamType.__members__.values():
        if exam_type is et.value[0]:
            return et.value[1]
    else:
        raise IllegalArgumentError(message='Unknown question type {}.'.format(exam_type))


@register.filter(name='replace_page')
def replace_page(full_path: str, page: int):
    return set_query_parameter(full_path, 'page', page)


@register.filter(name='range_to')
def range_to(from_val: int, to_val: int):
    return range(from_val, to_val + 1)


@register.filter(name='lookup')
def range_to(arr: list, i: int):
    return arr[i]


# check whether user is student
@register.filter(name='is_student')
def is_student(user: User):
    try:
        student = Student.objects.get(user=user)
        return student

    except Exception:
        return False


@register.filter(name='readableIdentity')
def readableIdentity(identity: int):
    IDENTITY = (
        (0, ''),
        (1, '訪客'),
        (2, '學生'),
        (3, '老師'),
    )
    return IDENTITY[identity][1]


@register.filter(name='student_data')
def student_data(user: User):
    student = Student.objects.get(user=user)
    try:
        data = [student.department.name, student.grade, student.squadron.name]
        return data

    except Exception:
        data = ['None', student.grade, 'None']
        return data


@register.filter(name='check_correct')
def check_correct(option: str, question: Question):
    if question.option.index(option) == question.answer:
        return True

    else:
        return False


@register.filter(name='readable_state')
def readable_state(state: int):
    STATE = (
        (0, ''),
        (1, '審核通過'),
        (2, '審核未通過'),
        (3, '等待審核'),
        (4, '被回報錯誤'),
        (5, '被回報錯誤，已處理'),
        (6, '暫存'),
    )
    return STATE[state][1]


@register.filter(name='readable_report_state')
def readable_report_state(state: int):
    STATE = (
        (0, '暫存'),
        (1, '待處理'),
        (2, '處理中'),
        (3, '已解決'),
    )
    return STATE[state][1]


@register.filter(name='trans_int')
def trans_int(score: float):
    return int(score)


@register.filter(name='responsible_unit')
def responsible_unit(category: ReportCategory, required_privilege: UserType):
    return (category.responsibility & required_privilege.value[0]) > 0


@register.filter(name='question_kind')
def question_kind(question_type: int):
    if question_type == QuestionType.QA.value[0]:
        return 'listening'
    elif question_type == QuestionType.ShortConversation.value[0]:
        return 'listening'
    elif question_type == QuestionType.Grammar.value[0]:
        return 'reading'
    elif question_type == QuestionType.Phrase.value[0]:
        return 'reading'
    elif question_type == QuestionType.ParagraphUnderstanding.value[0]:
        return 'reading'
    else:
        return 'unknown'


@register.filter(name='is_finished')
def is_finished(exam: Exam, user: User):
    try:
        answer_sheet = exam.answersheet_set.get(user_id=user.id)
        if answer_sheet.score is None:
            return False
        else:
            return True
    except ObjectDoesNotExist:
        return False


@register.filter(name='readable_report_state')
def readable_report_state(state: int):
    STATE = (
        (0, '暫存'),
        (1, '待處理'),
        (2, '處理中'),
        (3, '已解決'),
    )
    return STATE[state][1]


@register.filter(name='belongs_to')
def belongs_to(category: ReportCategory, privilege: UserType):
    return category.responsibility & privilege.value[0] > 0


@register.filter(name='summary')
def summary(completed_string: str, wanted: int):
    if len(completed_string) > wanted:
        return completed_string[:wanted] + '...'
    else:
        return completed_string


@register.filter(name='readable_question_query_content')
def readable_question_query_content(question_query_content: str):
    question_query = [_.split('=') for _ in question_query_content.split('&')]
    readable_query_content = ''

    for item in question_query:
        if 'state' in item:
            STATE = (
                (0, ''),
                (1, '審核通過'),
                (2, '審核未通過'),
                (3, '等待審核'),
                (4, '被回報錯誤'),
                (5, '被回報錯誤，已處理'),
                (6, '暫存'),
            )
            readable_query_content += '狀態="' + STATE[int(item[1])][1] + '"+'

        elif 'difficulty' in item:
            readable_query_content += '難度="' + item[1] + '"+'

        elif 'question_content' in item:
            readable_query_content += '試題內容="' + item[1] + '"+'

        elif 'question_type' in item:
            TYPE = (
                (0, ''),
                (1, '聽力／問答'),
                (2, '聽力／簡短對話'),
                (3, '閱讀／文法'),
                (4, '閱讀／名詞片語'),
                (5, '閱讀／段落理解')
            )
            readable_query_content += '類型="' + TYPE[int(item[1])][1] + '"'

    return readable_query_content


@register.filter(name='readable_user_query_content')
def readable_user_query_content(user_query_content: str):
    user_query = [_.split('=') for _ in user_query_content.split('&')]
    readable_user_query_content = ''

    for item in user_query:
        if 'department' in item:
            readable_user_query_content += '科系="' + item[1] + '"+'

        elif 'grade' in item:
            readable_user_query_content += '年班="' + item[1] + '"+'

        elif 'squadron' in item:
            readable_user_query_content += '中隊="' + item[1] + '"+'

        elif 'name' in item:
            readable_user_query_content += '學號/姓名="' + item[1] + '"'

    return readable_user_query_content