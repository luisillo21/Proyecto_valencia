# Generated by Django 2.2.5 on 2020-03-24 16:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('evaluacion', '0006_anexos_nombre'),
    ]

    operations = [
        migrations.AlterField(
            model_name='anexos',
            name='nota_referencia',
            field=models.IntegerField(blank=True, default=6, null=True),
        ),
    ]
