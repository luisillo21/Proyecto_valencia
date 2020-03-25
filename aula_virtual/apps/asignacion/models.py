from django.db import models

# Create your models here.
from aula_virtual.apps.seguridad.models import Personas

from aula_virtual.apps.evaluacion.models import Examen

ESTADO_CHOICES = [
    ('INACTIVO', 'Inactivo'),
    ('ACTIVO', 'Activo')
]

class Curso(models.Model):
    id_curso = models.AutoField(primary_key=True)
    curso = models.CharField(max_length=45,null=False,blank=False)
    descripcion= models.CharField(max_length=200,null=True,blank=True,default='sin descripcion')
    paralelo = models.CharField(max_length=12,null=False,blank=False)
    estado = models.CharField(max_length=45,null=True,blank=True,default='ACTIVO',choices=ESTADO_CHOICES)

    class Meta:
        verbose_name = 'curso'
        verbose_name_plural = 'cursos',
        db_table = 'curso'

    def __unicode__(self):
        return self.id_curso

    def __str__(self):
        return '{} {} descripción: {}'.format(self.curso,self.paralelo,self.descripcion)

class Alumno(models.Model):
    id_alumno = models.AutoField(primary_key=True)
    persona = models.ForeignKey(Personas,on_delete=models.CASCADE,related_name='fk_persona_alumno',null=False,db_column='persona_alumno')
    estado = models.CharField(max_length=45,null=True,blank=True,default='ACTIVO',choices=ESTADO_CHOICES)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE,null=True,blank=True)
    estado = models.CharField(max_length=45,null=True,blank=True,default='ACTIVO',choices=ESTADO_CHOICES)

    class Meta:
        verbose_name = 'alumno'
        verbose_name_plural = 'alumnos',
        db_table = 'alumno'

    def __unicode__(self):
        return self.id_alumno

    def __str__(self):
        return self.persona.nombres


class Asignar_examen(models.Model):
    id_asig_examen= models.AutoField(primary_key=True)
    examen = models.ForeignKey(Examen,on_delete=models.CASCADE,related_name='fk_examen_asig')
    curso = models.ManyToManyField(Curso,db_table='curso_examenes',related_name='fk_curso_examenes')
    estado = models.CharField(max_length=45,null=True,blank=True,default='ACTIVO',choices=ESTADO_CHOICES)

    class Meta:
        verbose_name = 'Asignar examen'
        verbose_name_plural = 'Asignar examen',
        db_table = 'asignar_examen'

    def __unicode__(self):
        return self.id_asig_examen

    def __str__(self):
        return self.examen.nombre