# Generated by Django 2.2.5 on 2020-03-24 12:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('evaluacion', '0005_auto_20200324_1159'),
        ('asignacion', '0003_auto_20200323_1318'),
    ]

    operations = [
        migrations.CreateModel(
            name='Asignar_examen',
            fields=[
                ('id_asig_examen', models.AutoField(primary_key=True, serialize=False)),
                ('curso', models.ManyToManyField(db_table='curso_examenes', related_name='fk_curso_examenes', to='asignacion.Curso')),
                ('examen', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_examen_asig', to='evaluacion.Examen')),
            ],
            options={
                'verbose_name': 'Asignar examen',
                'verbose_name_plural': ('Asignar examen',),
                'db_table': 'asignar_examen',
            },
        ),
    ]