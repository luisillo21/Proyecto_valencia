from django import forms
from django.forms import ModelForm

from .models import *


class formPermisos(forms.ModelForm):
    class Meta:
        model = Permisos
        fields = [
            "rol",
            "menu",
            ]

        labels = {
            "rol" : "Rol",
            "menu" : "Menu",
        }


    
 