from django.db.models import Q
from math import ceil

from alcpt.definitions import QuestionType
from alcpt.models import Question, TestPaper, User
from alcpt.utility import save_file


def query_questions(*, question_type: int, question_content: str, difficulty: int, state: int):
    queries = Q()

    if question_type:
        queries &= Q(q_type=question_type)

    if question_content:
        queries &= Q(q_content__icontains=question_content)

    if difficulty:
        queries &= Q(difficulty=difficulty)

    if state:
        queries &= Q(state=state)

    questions = Question.objects.exclude(state=0).filter(queries).order_by('created_time')       # 題庫管理員不需狀態為"暫存"的題目

    return questions
