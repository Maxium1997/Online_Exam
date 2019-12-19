from django.db.models import Q
from django.utils import timezone
import random

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
def random_select(types_counts: list):
    passed_questions = Question.objects.filter(state=1)

    qaList = list(passed_questions.filter(q_type=1))
    shortConversationList = list(passed_questions.filter(q_type=2))
    grammarList = list(passed_questions.filter(q_type=3))
    phraseList = list(passed_questions.filter(q_type=4))
    paragraphUnderstandingList = list(passed_questions.filter(q_type=5))

    random.shuffle(qaList)
    random.shuffle(shortConversationList)
    random.shuffle(grammarList)
    random.shuffle(phraseList)
    random.shuffle(paragraphUnderstandingList)

    questions = []
    questions.extend(qaList[:types_counts[0]])
    questions.extend(shortConversationList[:types_counts[1]])
    questions.extend(grammarList[:types_counts[2]])
    questions.extend(phraseList[:types_counts[3]])
    questions.extend(paragraphUnderstandingList[:types_counts[4]])

    return questions
