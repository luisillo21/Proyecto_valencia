# Generated by Django 2.2.5 on 2020-03-22 19:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('evaluacion', '0003_auto_20200322_1931'),
    ]

    operations = [
        migrations.AlterField(
            model_name='opciones',
            name='descripcion',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]
