# -*- coding: utf-8 -*-
# Generated by Django 1.11.17 on 2020-02-20 08:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alcpt', '0007_auto_20200219_0102'),
    ]

    operations = [
        migrations.AlterField(
            model_name='answersheet',
            name='score',
            field=models.PositiveSmallIntegerField(default=0),
        ),
    ]
