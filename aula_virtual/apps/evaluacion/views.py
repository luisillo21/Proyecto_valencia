from django.shortcuts import render,redirect,render_to_response
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from aula_virtual.apps.seguridad.models import Usuario
from .models import *
from .forms import *
from django.urls import reverse_lazy


# Create your views here.

#----Crud de Anexos

class Opcion(ListView):
    model = Opciones
    queryset = model.objects.filter(estado='ACTIVO')
    context_object_name = 'opc'
    template_name = 'opciones/opciones.html'



class AddOpciones(CreateView):
    model = Opciones
    form_class = formOpciones
    template_name = 'opciones/agregar_opciones.html'
    success_url = reverse_lazy('evaluacion:opciones')


class EditOpciones(UpdateView):
    model = Opciones
    form_class = formOpciones
    template_name = 'opciones/agregar_opciones.html'
    success_url = reverse_lazy('evaluacion:opciones')


def eliminar_opciones(request, id):
    opcion = Opciones.objects.get(id_opcion=id)
    try:
        if request.method == 'POST':
            opcion.estado = 'INACTIVO'
            opcion.save()
            return redirect('evaluacion:opciones')

    except Exception as e:
        return render(request, 'opciones/eliminar_opciones.html', {'error': e})

    return render(request, 'opciones/eliminar_opciones.html', {'opcion': opcion})


#----Crud de Anexos

class Preguntas(ListView):
    model = Pregunta
    queryset = model.objects.filter(estado='ACTIVO')
    context_object_name = 'preguntas'
    template_name = 'pregunta/preguntas.html'



class Addpreguntas(CreateView):
    model = Pregunta
    form_class = formPreguntas
    template_name = 'pregunta/agregar_pregunta.html'
    success_url = reverse_lazy('evaluacion:preguntas')


class EditPreguntas(UpdateView):
    model = Pregunta
    form_class = formPreguntas
    template_name = 'pregunta/agregar_pregunta.html'
    success_url = reverse_lazy('evaluacion:preguntas')


def eliminar_preguntas(request, id):
    pregunta = Pregunta.objects.get(id_pregunta=id)
    try:
        if request.method == 'POST':
            pregunta.estado = 'INACTIVO'
            pregunta.save()
            return redirect('evaluacion:preguntas')

    except Exception as e:
        return render(request, 'pregunta/eliminar_pregunta.html', {'error': e})

    return render(request, 'pregunta/eliminar_pregunta.html', {'pregunta': pregunta})

#----Crud de Examenes

class Examenes(ListView):
    model = Examen
    queryset = model.objects.filter(estado='ACTIVO')
    context_object_name = 'examenes'
    template_name = 'examenes/examenes.html'



class AddExamenes(CreateView):
    model = Examen
    form_class = formExamen
    template_name = 'examenes/agregar_examenes.html'
    success_url = reverse_lazy('evaluacion:examenes')


class EditExamenes(UpdateView):
    model = Examen
    form_class = formExamen
    template_name = 'examenes/agregar_examenes.html'
    success_url = reverse_lazy('evaluacion:examenes')


def eliminar_examenes(request, id):
    examen = Examen.objects.get(id_examen=id)
    try:
        if request.method == 'POST':
            examen.estado = 'INACTIVO'
            examen.save()
            return redirect('evaluacion:examenes')

    except Exception as e:
        return render(request, 'examenes/eliminar_examenes.html', {'error': e})

    return render(request, 'examenes/eliminar_examenes.html', {'examen': examen})


class Materias(ListView):
    model = Materia
    queryset = model.objects.filter(estado='ACTIVO')
    context_object_name = 'materias'
    template_name = 'materias/materias.html'


class AddMaterias(CreateView):
    model = Materia
    form_class = formMateria
    template_name = 'materias/agregar_materias.html'
    success_url = reverse_lazy('evaluacion:materias')


class EditMaterias(UpdateView):
    model = Materia
    form_class = formMateria
    template_name = 'materias/agregar_materias.html'
    success_url = reverse_lazy('evaluacion:materias')


def eliminar_materias(request, id):
    materia = Materia.objects.get(id_materia=id)
    try:
        if request.method == 'POST':
            materia.estado = 'INACTIVO'
            materia.save()
            return redirect('evaluacion:materias')

    except Exception as e:
        return render(request, 'materias/eliminar_materias.html', {'error': e})
    return render(request, 'materias/eliminar_materias.html', {'materia': materia})