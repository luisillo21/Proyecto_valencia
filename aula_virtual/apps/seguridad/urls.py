from .views import *
from django.urls import path

urlpatterns = [
    path('',login, name='iniciar_sesion'),
    path('salir/',salir, name='salir'),
    path('inicio/',inicio, name='inicio'),
    
]