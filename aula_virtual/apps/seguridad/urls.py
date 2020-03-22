from .views import *
from django.urls import path

urlpatterns = [
    path('',login, name='iniciar_sesion'),
    path('salir/',salir, name='salir'),
    path('inicio/',inicio, name='inicio'),


    #-- Url de PERMISOS   eliminar_permiso
    path('permisos/',Permiso.as_view(),name='permisos'),
    path('agregar_permiso/',AddPermiso.as_view(),name='agregar_permiso'),
    path('edit_permiso/<int:pk>',EditPermiso.as_view(),name='editar_permiso'),
    path('eliminar_permiso/<int:id>/',eliminar_permiso,name='eliminar_permiso'),

    #-- Url de personas
    path('personas/', Persona.as_view(), name='personas'),
    path('agregar_personas/', AddPersona.as_view(), name='agregar_personas'),
    path('edit_personas/<int:pk>', EditPersona.as_view(), name='editar_personas'),
    path('eliminar_personas/<int:id>/', eliminar_persona, name='eliminar_personas'),

    #-- Url de usuarios
    path('usuarios/', Usuario_listar.as_view(), name='usuarios'),
    path('agregar_usuarios/', AddUsuario.as_view(), name='agregar_usuarios'),
    path('edit_usuarios/<int:pk>', EditUsuario.as_view(), name='editar_usuarios'),
    path('eliminar_usuarios/<int:id>/', eliminar_usuario, name='eliminar_usuarios'),
]