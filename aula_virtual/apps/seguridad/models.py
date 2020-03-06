from django.db import models

# Create your models here.

class Personas(models.Model):
    ESTADOS_CHOICES = [
                        ('a','activo'),
                        ('i','inactivo')
                      ]
    id_persona = models.AutoField(primary_key=True)
    nombres = models.CharField(null=False, max_length=50,blank=False)
    apellidos = models.CharField(null=False, max_length=50,blank=False)
    cedula = models.CharField(blank=True,null=True,default="No registrado",max_length=50)
    estado = models.CharField(blank=False,max_length=50,choices=ESTADOS_CHOICES,null=False)

    class Meta:
        verbose_name ='Persona'
        verbose_name_plural='Personas',
        db_table ='persona'

    def __str__(self):
        return self.nombres,self.apellidos

class Usuario(models.Model):
    ESTADO_CHOICES = [
        ('INACTIVO', 'Inactivo'),
        ('ACTIVO', 'Activo')
    ]
    TIPO_CHOICES = [
        ('PROFESOR', 'Profesor'),
        ('ALUMNO', 'Alumno')
    ]    
    id_usuario = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=45, unique=True, blank=False, null=False)
    correo = models.EmailField(blank=True,max_length=80,null=True,default='example@gmail.com')
    clave = models.CharField(max_length=45, blank=False, null=False)
    id_persona = models.ForeignKey(
        Personas, on_delete=models.CASCADE, db_column='id_persona')
    tipo_usuario = models.CharField(null=False,blank=False,choices=TIPO_CHOICES,max_length=50)
    estado = models.CharField(blank=False,max_length=50,choices=ESTADO_CHOICES,null=False)


    class Meta:
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios',
        db_table = 'usuario'

    def __str__(self):
        return self.usuario

class Menu(models.Model):
    ESTADO_CHOICES = [
        ('INACTIVO', 'Inactivo'),
        ('ACTIVO', 'Activo')
    ]
    id_menu = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=False, unique=True, null=False, db_column='descripcion')
    estado = models.CharField(blank=False,max_length=50,choices=ESTADO_CHOICES,null=False)
    url = models.CharField(blank=False, null=False, max_length=60)

    class Meta:
        verbose_name = 'Menu'
        verbose_name_plural = 'Menu',
        db_table = 'menu'

    def __str__(self):
        return self.nombre 
    
    def __unicode__(self):
        return self.id_menu

class Permisos(models.Model):
    id_permiso = models.AutoField(primary_key=True)
    menu = models.ManyToManyField(
        Menu, related_name="fk_menu", db_table='permiso_menu')
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE,
                               related_name="fk_usuario", db_column='id_rol',blank=False, null=False)


    class Meta:
        verbose_name = 'Permiso'
        verbose_name_plural = 'Permisos',
        db_table = 'permisos'
    

    def __unicode__(self):
        return self.id_rol,self.acciones