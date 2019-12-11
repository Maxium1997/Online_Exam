from django.shortcuts import render

from .definitions import UserType
from .models import Proclamation

# Create your views here.


def index(request):
    data = {
        "privileges": UserType.__members__,
        "proclamations": Proclamation.objects.filter(is_public=True)
    }
    return render(request, 'index.html', data)
