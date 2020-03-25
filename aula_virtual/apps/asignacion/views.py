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
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'cursos/cursos.html'

    def get_context_data(self, **kwargs):
        contexto = {}
        contexto['cursos'] = self.get_queryset()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request, self.template_name, self.get_context_data())
        else:
            return redirect('seguridad:iniciar_sesion')


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
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'alumnos/alumnos.html'

    def get_context_data(self, **kwargs):
        contexto = {}
        contexto['alumnos'] = self.get_queryset()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request, self.template_name, self.get_context_data())
        else:
            return redirect('seguridad:iniciar_sesion')


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


class Asignaciones(ListView):
    model = Asignar_examen
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'asignar_examenes/asignaciones.html'

    def get_context_data(self, **kwargs):
        contexto = {}
        contexto['asignaciones'] = self.get_queryset()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request, self.template_name, self.get_context_data())
        else:
            return redirect('asignacion:asignaciones')


class AddAsignacion(CreateView):
    model = Asignar_examen
    form_class = formAsignar
    template_name = 'asignar_examenes/agregar_asignaciones.html'
    success_url = reverse_lazy('asignacion:asignaciones')


class EditAsignacion(UpdateView):
    model = Asignar_examen
    form_class = formAsignar
    template_name = 'asignar_examenes/agregar_asignaciones.html'
    success_url = reverse_lazy('asignacion:asignaciones')


def eliminar_asignacion(request, id):
    asig = Asignar_examen.objects.get(id_asig_examen=id)
    try:
        if request.method == 'POST':
            asig.estado = 'INACTIVO'
            asig.save()
            return redirect('asignacion:asignaciones')

    except Exception as e:
        return render(request, 'asignar_examenes/eliminar_asignaciones.html', {'error': e})

    return render(request, 'asignar_examenes/eliminar_asignaciones.html', {'asig': asig})