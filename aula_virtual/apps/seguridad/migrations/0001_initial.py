# Generated by Django 2.2.5 on 2020-03-06 01:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id_menu', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(db_column='descripcion', max_length=45, unique=True)),
                ('estado', models.CharField(choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], max_length=50)),
                ('url', models.CharField(max_length=60)),
            ],
            options={
                'verbose_name': 'Menu',
                'verbose_name_plural': ('Menu',),
                'db_table': 'menu'
            },
        ),
        migrations.CreateModel(
            name='Personas',
            fields=[
                ('id_persona', models.AutoField(primary_key=True, serialize=False)),
                ('nombres', models.CharField(max_length=50)),
                ('apellidos', models.CharField(max_length=50)),
                ('cedula', models.CharField(blank=True, default='No registrado', max_length=50, null=True)),
                ('estado', models.CharField(choices=[('a', 'activo'), ('i', 'inactivo')], max_length=50)),
            ],
            options={
                'verbose_name': 'Persona',
                'verbose_name_plural': ('Personas',),
                'db_table': 'persona'
            },
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id_usuario', models.AutoField(primary_key=True, serialize=False)),
                ('usuario', models.CharField(max_length=45, unique=True)),
                ('correo', models.EmailField(blank=True, default='example@gmail.com', max_length=80, null=True)),
                ('clave', models.CharField(max_length=45)),
                ('tipo_usuario', models.CharField(choices=[('PROFESOR', 'Profesor'), ('ALUMNO', 'Alumno')], max_length=50)),
                ('estado', models.CharField(choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], max_length=50)),
                ('id_persona', models.ForeignKey(db_column='id_persona', on_delete=django.db.models.deletion.CASCADE, to='seguridad.Personas')),
            ],
            options={
                'verbose_name': 'Usuario',
                'verbose_name_plural': ('Usuarios',),
                'db_table': 'usuario'
            },
        ),
        migrations.CreateModel(
            name='Permisos',
            fields=[
                ('id_permiso', models.AutoField(primary_key=True, serialize=False)),
                ('menu', models.ManyToManyField(db_table='permiso_menu', related_name='fk_menu', to='seguridad.Menu')),
                ('usuario', models.ForeignKey(db_column='id_rol', on_delete=django.db.models.deletion.CASCADE, related_name='fk_usuario', to='seguridad.Usuario')),
            ],
            options={
                'verbose_name': 'Permiso',
                'verbose_name_plural': ('Permisos',),
                'db_table': 'permisos'
            },
        ),
    ]
