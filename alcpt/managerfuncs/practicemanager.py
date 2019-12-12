from django.utils import timezone

from datetime import datetime

from ..managerfuncs import testmanager
from .testmanager import random_select
from alcpt.models import User, Exam
from alcpt.definitions import QuestionType, ExamType, QuestionTypeCounts
from alcpt.exceptions import IllegalArgumentError


# 尚未完成
def create_practice(*, user: User, practice_type: ExamType, question_types: list, question_num: int, integration: False):
    now = datetime.now()
    name = "{}-practice-{}-{}".format(practice_type.value[1], user.reg_id, now)
    question_type_counts = QuestionTypeCounts.Exam.value[0] if integration else []      # [40, 20, 15, 15, 10] or []

    if not integration:     # 非綜合練習
        for question_type in QuestionType.__members__.values():
            if question_type in question_types:
                question_type_counts.append(int(question_num / len(question_types)))
            else:
                question_type_counts.append(0)

        if sum(question_type_counts) != question_num:
            i = list(QuestionType.__members__.values()).index(question_types[len(question_types) - 1])
            question_type_counts[i] += question_num - sum(question_type_counts)

        question_num_selected = 0
        selected_questions = []
        for question_type in question_types:
            selected_questions += random_select(question_type_counts, question_type)
            question_num_selected += len(selected_questions)
        if question_num_selected < question_num:
            raise IllegalArgumentError(message="There is too few questions in the database.")

        testpaper = testmanager.create_testpaper(name=name,
                                                 created_by=user,
                                                 is_testpaper=0)

        testpaper_id = testpaper.id
        for question in selected_questions:
            testpaper.question_set.add(question)

        practice = Exam.objects.create(name=name,
                                       exam_type=practice_type.value[0],
                                       start_time=timezone.now(),
                                       testpaper_id=testpaper_id,
                                       duration=0,
                                       is_public=1,
                                       created_by_id=user.id)

        return practice, selected_questions
