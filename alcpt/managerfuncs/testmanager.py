from django.db.models import Q
from django.utils import timezone

from alcpt.models import User, TestPaper, Question, Exam
from alcpt.definitions import QuestionType, ExamType


# OK
def create_testpaper(name: str, created_by: User, is_testpaper: int):
    testpaper = TestPaper.objects.create(name=name,
                                         created_by_id=created_by.id,
                                         is_testpaper=is_testpaper)
    testpaper.valid = False
    testpaper.save()

    return testpaper


# Not yet
def random_select(types_counts: list, question_type: QuestionType, testpaper: TestPaper = None):
    reach_limit = types_counts[question_type.value[0] - 1]

    if testpaper:
        selected_questions = testpaper.question_set.filter(question_type=question_type.value[0])

        selected_num = reach_limit - selected_questions.count()

        if selected_num:
            questions = Question.objects.filter(question_type=question_type.value[0], is_valid=True).exclude(id__in=selected_questions)

            if questions:
                questions = sample(list(questions), min(len(questions), selected_num))
                for question in questions:
                    testpaper.question_set.add(question)

                selected_num = len(questions)

        return selected_num

    else:
        selected_questions = Question.objects.filter(question_type=question_type.value[0], is_valid=True)

        if selected_questions:
            selected_questions = sample(list(selected_questions), reach_limit)

        return selected_questions
