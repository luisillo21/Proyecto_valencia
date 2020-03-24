from django.db import models
from aula_virtual.apps.seguridad.models import Usuario

# Create your models here.

ESTADO_CHOICES = [
    ('INACTIVO', 'Inactivo'),
    ('ACTIVO', 'Activo')
]

class Materia(models.Model):
    id_materia = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=45,null=False,blank=False,unique=True)
    estado = models.CharField(max_length=45,null=False,blank=False,choices=ESTADO_CHOICES)

    def __unicode__(self):
        return  self.id_materia

    def __str__(self):
        return self.descripcion

    class Meta:
        verbose_name = 'Materia',
        verbose_name_plural = 'Materias',
        db_table = 'materia'

class Examen(models.Model):
    id_examen = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100,null=False,blank=False)
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE, null=False, blank=False,related_name='autor_del_examen',db_column='usuario')
    id_materia = models.ForeignKey(Materia,db_column='materia', on_delete=models.CASCADE, null=False, blank=False)
    estado = models.CharField(default='ACTIVO',blank=True,null=True,max_length=45,choices=ESTADO_CHOICES)


    def __unicode__(self):
        return  self.id_examen

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = 'Examen',
        verbose_name_plural = 'Examenes',
        db_table = 'examen'


class Anexos(models.Model):
    id_anexo = models.AutoField(primary_key=True)
    link = models.TextField(null=False, blank=False)
    nombre = models.CharField(max_length=45,null=False,blank=False,unique=True)
    examen = models.ForeignKey(Examen,on_delete=models.CASCADE,null=False)
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE, null=False, blank=False,
                                related_name='autor_del_anexo', db_column='usuario')
    nota_referencia = models.IntegerField(null=True, blank=True,default=6)
    estado = models.CharField(default='ACTIVO', blank=True, null=True, max_length=45, choices=ESTADO_CHOICES)

    def __unicode__(self):
        return  self.id_anexo

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = 'Anexo',
        verbose_name_plural = 'Anexos',
        db_table = 'anexos'

class Opciones(models.Model):
    id_opcion = models.AutoField(primary_key=True)
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE,related_name='autor_de_opciones')
    descripcion = models.CharField(max_length=50,blank=False,unique=True,null=False)
    respuesta = models.BooleanField(null=False, blank=False)
    estado = models.CharField(max_length=45,blank=True,null=True,default='ACTIVO',choices=ESTADO_CHOICES)

    def __unicode__(self):
        return self.id_opcion

    def __str__(self):
        return self.descripcion

    class Meta:
        verbose_name = 'Opcion',
        verbose_name_plural = 'Opciones',
        db_table = 'opciones'


class Pregunta(models.Model):
    id_pregunta = models.AutoField(primary_key=True)
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE,db_column='usuario',related_name='preguntas_del_usuario')
    pregunta = models.TextField(max_length=200,null=False,blank=False)
    examen = models.ForeignKey(Examen,on_delete=models.CASCADE,related_name='preguntas_del_examen', db_column='id_examen')
    opciones = models.ManyToManyField(Opciones,db_table='pregunta_opciones',null=True,blank=True,related_name='fk_opciones_preguntas')


    def __str__(self):
        return self.pregunta

    class Meta:
        verbose_name = 'Pregunta',
        verbose_name_plural = 'Preguntas',
        db_table = 'preguntas'
