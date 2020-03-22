from .views import *
from django.urls import path

urlpatterns = [
    path('',login, name='iniciar_sesion'),
    path('salir/',salir, name='salir'),
    path('inicio/',inicio, name='inicio'),
    path('usuarios/',usuarios,name='usuarios'),
    #-- Url de los permisos   eliminar_permiso
    path('permisos/',Permiso.as_view(),name='permisos'),
    path('agregar_permiso/',AddPermiso.as_view(),name='agregar_permiso'),
    path('edit_permiso/<int:pk>',EditPermiso.as_view(),name='editar_permiso'),
    path('eliminar_permiso/<int:id>/',eliminar_permiso,name='eliminar_permiso'),
]  