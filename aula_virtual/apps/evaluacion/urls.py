from .views import *
from django.urls import path

urlpatterns = [

#-- Url de PERMISOS   eliminar_permiso
    path('anexos/',Anexo_lst,name='anexos'),
    path('agregar_anexo/',AddAnexos.as_view(),name='agregar_anexos'),
    path('edit_anexos/<int:pk>',EditAnexos.as_view(),name='edit_anexos'),
    path('eliminar_permiso/<int:id>/',eliminar_anexo,name='eliminar_anexos'),
]