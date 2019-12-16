from math import ceil

from django.db.models import Q
from django.utils import timezone
from django.contrib.auth.hashers import make_password

from alcpt.models import User, Department, Squadron, Student
from alcpt.definitions import UserType
from alcpt.exceptions import IllegalArgumentError


def query_users(*, department: Department, grade: int, squadron: Squadron, name: str, filter_func=None):
    queries = Q()

    if department:
        queries &= Q(student__department=department)

    if grade is not None:
        queries &= Q(student__grade=grade)

    if squadron:
        queries &= Q(student__squadron=squadron)

    if name is not None:
        queries &= Q(reg_id__icontains=name) | Q(name__icontains=name)

    users = User.objects.filter(queries)
    users = users.order_by('-reg_id')

    for user in users:
        user.update_time = timezone.localtime(user.update_time)
        user.created_time = timezone.localtime(user.created_time)

    if filter_func:
        users = list(filter(filter_func, users))

    return users


def create_users(reg_ids: list, privilege: int):
    queries = Q()

    for reg_id in reg_ids:
        queries |= Q(reg_id=reg_id)

    existed_users = User.objects.filter(queries)

    if existed_users:
        raise IllegalArgumentError("Existed user: {}".format(', '.join([user.reg_id for user in existed_users])))

    User.objects.bulk_create([User(reg_id=reg_id,
                                   privilege=privilege,
                                   password=make_password(reg_id)) for reg_id in reg_ids])

    return User.objects.filter(queries)
