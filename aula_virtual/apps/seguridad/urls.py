from .views import *
from django.urls import path

urlpatterns = [
    path('',login, name='iniciar_sesion'),
    path('salir/',salir, name='salir'),
    path('inicio/',inicio, name='inicio'),
    path('usuarios/',usuarios,name='usuarios'),
    #-- Url de los permisos   eliminar_permiso
    path('permisos/',Permiso.as_view(),name='permisos'),
    path('eliminar_permiso/<int:id>/',eliminar_permiso,name='eliminar_permiso'),
]