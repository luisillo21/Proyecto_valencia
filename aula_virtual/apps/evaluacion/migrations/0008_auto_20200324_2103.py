# Generated by Django 2.2.5 on 2020-03-24 21:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('evaluacion', '0007_auto_20200324_1619'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='anexos',
            name='usuario',
        ),
        migrations.RemoveField(
            model_name='examen',
            name='usuario',
        ),
        migrations.RemoveField(
            model_name='opciones',
            name='usuario',
        ),
        migrations.RemoveField(
            model_name='pregunta',
            name='usuario',
        ),
    ]
