# Generated by Django 2.2.5 on 2020-03-22 12:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('seguridad', '0011_auto_20200322_0103'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personas',
            name='cedula',
            field=models.CharField(max_length=50, unique=True),
        ),
        migrations.AlterField(
            model_name='personas',
            name='estado',
            field=models.CharField(blank=True, choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], default='ACTIVO', max_length=50, null=True),
        ),
    ]
