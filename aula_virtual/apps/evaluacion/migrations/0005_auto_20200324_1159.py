# Generated by Django 2.2.5 on 2020-03-24 11:59

import aula_virtual.apps.evaluacion.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('seguridad', '0014_auto_20200322_1926'),
        ('evaluacion', '0004_auto_20200322_1932'),
    ]

    operations = [
        migrations.CreateModel(
            name='Materia',
            fields=[
                ('id_materia', models.AutoField(primary_key=True, serialize=False)),
                ('descripcion', models.CharField(max_length=45, unique=True)),
                ('estado', models.CharField(choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], max_length=45)),
            ],
            options={
                'verbose_name': ('Materia',),
                'verbose_name_plural': ('Materias',),
                'db_table': 'materia',
            },
        ),
        migrations.RenameField(
            model_name='opciones',
            old_name='estato',
            new_name='estado',
        ),
        migrations.AddField(
            model_name='opciones',
            name='respuesta',
            field=models.BooleanField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='opciones',
            name='usuario',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='autor_de_opciones', to='seguridad.Usuario'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='pregunta',
            name='usuario',
            field=models.ForeignKey(db_column='usuario', default=1, on_delete=django.db.models.deletion.CASCADE, related_name='preguntas_del_usuario', to='seguridad.Usuario'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='pregunta',
            name='opciones',
            field=models.ManyToManyField(blank=True, db_table='pregunta_opciones', null=True, related_name='fk_opciones_preguntas', to='evaluacion.Opciones'),
        ),
        migrations.CreateModel(
            name='Anexos',
            fields=[
                ('id_anexo', models.AutoField(primary_key=True, serialize=False)),
                ('link', models.TextField()),
                ('nota_referencia', models.IntegerField(blank=True, db_column='materia', default=6, null=True, verbose_name=aula_virtual.apps.evaluacion.models.Materia)),
                ('estado', models.CharField(blank=True, choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], default='ACTIVO', max_length=45, null=True)),
                ('examen', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='evaluacion.Examen')),
                ('usuario', models.ForeignKey(db_column='usuario', on_delete=django.db.models.deletion.CASCADE, related_name='autor_del_anexo', to='seguridad.Usuario')),
            ],
            options={
                'verbose_name': ('Anexo',),
                'verbose_name_plural': ('Anexos',),
                'db_table': 'anexos',
            },
        ),
        migrations.AddField(
            model_name='examen',
            name='id_materia',
            field=models.ForeignKey(db_column='materia', default=1, on_delete=django.db.models.deletion.CASCADE, to='evaluacion.Materia'),
            preserve_default=False,
        ),
    ]
