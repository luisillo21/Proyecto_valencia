from django.shortcuts import render,redirect,render_to_response
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from .models import *
from .forms import *
from django.urls import reverse_lazy
import hashlib
# Create your views here.


def inicio(request):
     if 'usuario' in request.session:
         return render(request, 'index.html')
     else:
        return redirect('seguridad:iniciar_sesion')


def login(request):
    contexto = {}
    try:
        if request.method == 'POST':
            var_usuario = request.POST.get('usu')
            var_contra = request.POST.get('pass')            
            usu = Usuario.objects.get(usuario=var_usuario, clave=var_contra, estado='ACTIVO')
            if usu:
                request.session['usuario'] = usu.id_usuario
                return redirect("seguridad:inicio") 
    except Exception as e:
        contexto['error'] = "Usuario o contraseña incorrectos"
        return render(request, 'Login.html', contexto)
    return render(request,'Login.html')

def salir(request):
    del request.session['usuario']
    return redirect('seguridad:inicio')




#-- CRUD DE LA PANTALLA PERMISOS

class Permiso(ListView):
    model = Permisos
    context_object_name = 'per'
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'permisos/permisos.html'
    

class AddPermiso(CreateView):
    model = Permisos
    form_class = formPermisos
    template_name = 'permisos/agregar_permiso.html'
    success_url = reverse_lazy('seguridad:permisos')

class EditPermiso(UpdateView):
    model = Permisos
    form_class = formPermisos
    template_name = 'permisos/agregar_permiso.html'
    success_url = reverse_lazy('seguridad:permisos')


def eliminar_permiso(request,id):
    permiso = Permisos.objects.get(id_permiso=id)
    try:
        if request.method == 'POST':
           permiso.estado = 'INACTIVO'
           permiso.save()
           return redirect('seguridad:permisos')

    except Exception as e:
        return render(request, 'permisos/eliminar_permisos.html', {'error':e})

    return render(request,'permisos/eliminar_permisos.html',{'permiso':permiso})

#-- CRUD DE PERSONAS

class Persona(ListView):
    model = Personas
    context_object_name = 'per'
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'personas/personas.html'

class AddPersona(CreateView):
    model = Personas
    form_class = formPersonas
    template_name = 'personas/agregar_personas.html'
    success_url = reverse_lazy('seguridad:personas')

class EditPersona(UpdateView):
    model = Personas
    form_class = formPersonas
    template_name = 'personas/agregar_personas.html'
    success_url = reverse_lazy('seguridad:personas')

def eliminar_persona(request,id):
    persona = Personas.objects.get(id_persona=id)
    try:
        if request.method == 'POST':
           persona.estado = 'INACTIVO'
           persona.save()
           return redirect('seguridad:personas')

    except Exception as e:
        return render(request, 'personas/eliminar_personas.html', {'error':e})

    return render(request,'personas/eliminar_personas.html',{'personas':persona})

#-- CRUD DE USUARIO

class Usuario_listar(ListView):
    model = Usuario
    context_object_name = 'usuario'
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'usuarios/usuarios.html'

class AddUsuario(CreateView):
    model = Usuario
    form_class = formUsuarios
    template_name = 'usuarios/agregar_usuarios.html'
    success_url = reverse_lazy('seguridad:usuarios')

class EditUsuario(UpdateView):
    model = Usuario
    form_class = formUsuarios
    template_name = 'usuarios/agregar_usuarios.html'
    success_url = reverse_lazy('seguridad:usuarios')

def eliminar_usuario(request,id):
    usuario = Usuario.objects.get(id_usuario=id)
    try:
        if request.method == 'POST':
           usuario.estado = 'INACTIVO'
           usuario.save()
           return redirect('seguridad:usuarios')

    except Exception as e:
        return render(request, 'usuarios/eliminar_usuarios.html', {'error':e})

    return render(request,'usuarios/eliminar_usuarios.html',{'usuario':usuario})