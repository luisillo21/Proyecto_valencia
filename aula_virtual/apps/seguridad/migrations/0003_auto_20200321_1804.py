# Generated by Django 2.2.5 on 2020-03-21 18:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('seguridad', '0002_auto_20200321_1747'),
    ]

    operations = [
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id_rol', models.AutoField(primary_key=True, serialize=False)),
                ('rol_nombre', models.CharField(choices=[('PROFESOR', 'Profesor'), ('ADMINISTRADOR', 'Administrador'), ('ALUMNO', 'Alumno')], max_length=45)),
                ('rol_estado', models.CharField(choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], max_length=45)),
            ],
            options={
                'verbose_name': 'Rol',
                'verbose_name_plural': ('Roles',),
                'db_table': 'rol',
            },
        ),
        migrations.RemoveField(
            model_name='usuario',
            name='tipo_usuario',
        ),
        migrations.AddField(
            model_name='personas',
            name='foto',
            field=models.ImageField(default=0, upload_to='usuarios_avatar'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='menu',
            name='menu_padre',
            field=models.ForeignKey(db_column='menu_padre', null=True, on_delete=django.db.models.deletion.SET_NULL, to='seguridad.Menu'),
        ),
        migrations.AlterField(
            model_name='menu',
            name='nombre',
            field=models.CharField(max_length=45, unique=True),
        ),
        migrations.AlterField(
            model_name='personas',
            name='cedula',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='personas',
            name='estado',
            field=models.CharField(choices=[('INACTIVO', 'Inactivo'), ('ACTIVO', 'Activo')], max_length=50),
        ),
        migrations.AddField(
            model_name='usuario',
            name='rol_usuario',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='seguridad.Roles'),
            preserve_default=False,
        ),
    ]
