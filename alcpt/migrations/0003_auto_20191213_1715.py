# -*- coding: utf-8 -*-
# Generated by Django 1.11.17 on 2019-12-13 09:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alcpt', '0002_auto_20191211_1515'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='department',
            options={'ordering': ('id',)},
        ),
        migrations.AlterModelOptions(
            name='squadron',
            options={'ordering': ('id',)},
        ),
        migrations.AddField(
            model_name='question',
            name='faulted_reason',
            field=models.CharField(blank=True, default='', max_length=255, null=True),
        ),
    ]