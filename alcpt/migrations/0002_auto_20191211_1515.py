# -*- coding: utf-8 -*-
# Generated by Django 1.11.17 on 2019-12-11 07:15
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('alcpt', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OptionList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('added_time', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'ordering': ('added_time',),
            },
        ),
        migrations.RemoveField(
            model_name='answer',
            name='option_list',
        ),
        migrations.AddField(
            model_name='optionlist',
            name='answer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='alcpt.Answer'),
        ),
        migrations.AddField(
            model_name='optionlist',
            name='choice',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='alcpt.Choice'),
        ),
    ]
