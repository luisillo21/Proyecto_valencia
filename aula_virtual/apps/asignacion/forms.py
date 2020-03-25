from django import forms
from django.forms import ModelForm

from aula_virtual.apps.asignacion.models import *


class formCurso(forms.ModelForm):
    class Meta:
        model = Curso
        fields = [
            "curso",
            "descripcion",
            "paralelo",
            ]

        labels = {
            "curso" : "Curso",
            "descripcion" : "Descripciòn",
            "paralelo" : "Paralelo",
        }

        widgets = {
            "curso": forms.TextInput(attrs={"class": "form-control","placeholder":"Ingresa un curso"}),
            "paralelo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Ingresa un paralelo"}),
        }

class formAlumno(forms.ModelForm):
    class Meta:
        model = Alumno
        fields = [
            "persona",
            "curso",
            ]

        labels = {
            "persona" : "Persona",
            "curso" : "Curso al que pertenece",
        }

class formAsignar(forms.ModelForm):
    class Meta:
        model = Asignar_examen
        fields = [
            "examen",
            "curso",
            ]

        labels = {
            "persona" : "Persona",
            "curso" : "Curso al que pertenece",
        }

