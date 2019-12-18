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

    questions = Question.objects.exclude(state=1).exclude(state=3).exclude(state=5).filter(queries)

    return questions


def create_reading_question(q_content: str, q_type: str, created_by: User, difficulty: int):
    reading_question = Question.objects.create(q_content=q_content,
                                               q_type=q_type,
                                               created_by=created_by,
                                               difficulty=difficulty)
    reading_question.save()

    return reading_question


def create_listening_question(q_file, q_type: str, created_by: User, difficulty: int):
    listening_question = Question.objects.create(q_type=q_type,
                                                 created_by=created_by,
                                                 difficulty=difficulty)
    listening_question.q_file = save_file(file=q_file, path='question_{}'.format(listening_question.id))

    listening_question.save()

    return listening_question


