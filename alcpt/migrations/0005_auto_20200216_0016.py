# -*- coding: utf-8 -*-
# Generated by Django 1.11.28 on 2020-02-16 00:16
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('alcpt', '0004_auto_20200214_0950'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='optionlist',
            name='answer',
        ),
        migrations.RemoveField(
            model_name='optionlist',
            name='choice',
        ),
        migrations.DeleteModel(
            name='OptionList',
        ),
    ]
