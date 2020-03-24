from django.db.models import Q
from django import forms
from django.forms import ModelForm

from aula_virtual.apps.seguridad.models import Usuario
from aula_virtual.apps.seguridad.context_processors import permisos
from django.http import request

from .models import *


class formExamen(forms.ModelForm):
    class Meta:
        model = Examen
        fields = [
            "nombre",
            "usuario",
            "id_materia",
            ]

        labels = {
            "usuario" : "Autor del examen",
            "nombre" : "Nombre",
            "id_materia" : "Materia",
        }

        widgets = {
            "nombre": forms.TextInput(attrs={"class": "form-control", "placeholder":"ingrese el nombre del examen"}),
        }

class formAnexos(forms.ModelForm):
    class Meta:
        model = Anexos
        fields = [
            "link",
            "usuario",
            "examen",
            "nombre",
            "nota_referencia",
            ]

        labels = {
            "usuario" : "Autor del examen",
            "examen" : "Examen",
            "nombre" : "Nombre",
            "link" : "Link de un recurso",
            "nota_referencia":"Nota minima"
        }

        widgets = {
            "link": forms.TextInput(attrs={"class": "form-control", "placeholder":"ingrese el link de un video o blog para recomendar al alumno"}),
            "nota_referencia": forms.TextInput(attrs={"class": "form-control",
                                           "placeholder": "ingrese la nota minima que debe tener un alumno para mostrarle este recurso"}),
        }


class formOpciones(forms.ModelForm):
    class Meta:
        model = Opciones
        fields = [
            "usuario",
            "descripcion",
            "respuesta",
            ]

        labels = {
            "usuario" : "Autor de las opciones",
            "descripcion" : "Opcion",
            "respuesta" : "Esta opcion es la respuesta correcta?"
        }

        widgets = {
            "descripcion": forms.TextInput(attrs={"class": "form-control", "placeholder":"ingrese el link de un video o blog para recomendar al alumno"}),
        }

    def __init__(self, *args, **kwargs):
        super(formOpciones, self).__init__(*args, **kwargs)

        self.fields['usuario'].queryset = Usuario.objects.filter(
            usuario=request.session.get('usuario'))

class formPregunta(forms.ModelForm):
    class Meta:
        model = Opciones
        fields = [
            "usuario",
            "descripcion",
            "respuesta",
            ]

        labels = {
            "usuario" : "Autor de las opciones",
            "descripcion" : "Opcion",
            "respuesta" : "Esta opcion es la respuesta correcta?"
        }

        widgets = {
            "descripcion": forms.TextInput(attrs={"class": "form-control", "placeholder":"ingrese el link de un video o blog para recomendar al alumno"}),
        }

        def __init__(self, *args, **kwargs):
            super(formPregunta, self).__init__(*args, **kwargs)

            self.fields['usuario'].queryset = Usuario.objects.filter(
                usuario=request.session.get('usuario'))
