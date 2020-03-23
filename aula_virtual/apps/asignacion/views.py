from django.shortcuts import render
from django.shortcuts import render,redirect,render_to_response
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from .models import *
from .forms import *
from django.urls import reverse_lazy
# Create your views here.


class Cursos(ListView):
    model = Curso
    context_object_name = 'cursos'
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'cursos/cursos.html'


class AddCursos(CreateView):
    model = Curso
    form_class = formCurso
    template_name = 'cursos/agregar_cursos.html'
    success_url = reverse_lazy('asignacion:cursos')


class EditCursos(UpdateView):
    model = Curso
    form_class = formCurso
    template_name = 'cursos/agregar_cursos.html'
    success_url = reverse_lazy('asignacion:cursos')


def eliminar_cursos(request, id):
    curso = Curso.objects.get(id_curso=id)
    try:
        if request.method == 'POST':
            curso.estado = 'INACTIVO'
            curso.save()
            return redirect('asignacion:cursos')

    except Exception as e:
        return render(request, 'cursos/eliminar_cursos.html', {'error': e})

    return render(request, 'cursos/eliminar_cursos.html', {'curso': curso})


class Alumnos(ListView):
    model = Alumno
    context_object_name = 'alumnos'
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'alumnos/alumnos.html'


class AddAlumnos(CreateView):
    model = Alumno
    form_class = formAlumno
    template_name = 'alumnos/agregar_alumnos.html'
    success_url = reverse_lazy('asignacion:alumnos')


class EditAlumnos(UpdateView):
    model = Alumno
    form_class = formAlumno
    template_name = 'alumnos/agregar_alumnos.html'
    success_url = reverse_lazy('asignacion:alumnos')


def eliminar_alumnos(request, id):
    alumno = Alumno.objects.get(id_alumno=id)
    try:
        if request.method == 'POST':
            alumno.estado = 'INACTIVO'
            alumno.save()
            return redirect('asignacion:alumnos')

    except Exception as e:
        return render(request, 'alumnos/eliminar_alumnos.html', {'error': e})

    return render(request, 'alumnos/eliminar_alumnos.html', {'alumno': alumno})