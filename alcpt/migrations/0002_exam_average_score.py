# -*- coding: utf-8 -*-
# Generated by Django 1.11.17 on 2019-12-17 00:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alcpt', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='exam',
            name='average_score',
            field=models.FloatField(default=0),
        ),
    ]
