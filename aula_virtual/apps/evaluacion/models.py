from django.db import models
from aula_virtual.apps.seguridad.models import Usuario

# Create your models here.


class Examen(models.Model):
    id_examen = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100,null=False,blank=False)
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE, null=False, blank=False,related_name='autor_del_examen',db_column='usuario')
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = 'Examen',
        verbose_name_plural = 'Examenes',
        db_table = 'examen'


class Pregunta(models.Model):
    id_pregunta = models.AutoField(primary_key=True)
    pregunta = models.TextField(max_length=200,null=False,blank=False)
    opcion1 = models.CharField(max_length=100,null=False,blank=False)
    opcion2 = models.CharField(max_length=100, null=False,blank=False)
    respuesta = models.CharField(max_length=100, null=False,blank=False)
    examen = models.ForeignKey(Examen,on_delete=models.CASCADE,related_name='preguntas_del_examen', db_column='id_examen')


    def __str__(self):
        return self.pregunta

    class Meta:
        verbose_name = 'Pregunta',
        verbose_name_plural = 'Preguntas',
        db_table = 'preguntas'