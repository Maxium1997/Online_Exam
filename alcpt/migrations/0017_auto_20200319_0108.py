# Generated by Django 3.0.4 on 2020-03-19 01:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alcpt', '0016_auto_20200318_1708'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='stu_id',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]