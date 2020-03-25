from .views import *
from django.urls import path


urlpatterns = [

#-- Url de CURSOS------------------
    path('cursos/',Cursos.as_view(),name='cursos'),
    path('agregar_cursos/',AddCursos.as_view(),name='agregar_cursos'),
    path('edit_cursos/<int:pk>',EditCursos.as_view(),name='editar_cursos'),
    path('eliminar_cursos/<int:id>/',eliminar_cursos,name='eliminar_cursos'),

#-- Url de ALUMNOS------------------
    path('alumnos/',Alumnos.as_view(),name='alumnos'),
    path('agregar_alumnos/',AddAlumnos.as_view(),name='agregar_alumnos'),
    path('edit_alumnos/<int:pk>',EditAlumnos.as_view(),name='editar_alumnos'),
    path('eliminar_alumnos/<int:id>/',eliminar_alumnos,name='eliminar_alumnos'),

#-- Url de ASIGNACIONES------------------
    path('asignaciones/',Asignaciones.as_view(),name='asignaciones'),
    path('agregar_asignaciones/',AddAsignacion.as_view(),name='agregar_asignaciones'),
    path('edit_asignaciones/<int:pk>',EditAsignacion.as_view(),name='editar_asignaciones'),
    path('eliminar_asignaciones/<int:id>/',eliminar_asignacion,name='eliminar_asignaciones'),


]