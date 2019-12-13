from django.db.models import Q
from math import ceil

from alcpt.definitions import QuestionType
from alcpt.models import Question, TestPaper, User
from alcpt.utility import save_file


def query_questions(*, question_content: str, difficulty: int, state: int):
    queries = Q()

    if question_content:
        queries &= Q(question__icontains=question_content)

    if difficulty:
        queries &= Q(difficulty=difficulty)

    if state:
        queries &= Q(state=state)

    questions = Question.objects.filter(queries)

    return questions
