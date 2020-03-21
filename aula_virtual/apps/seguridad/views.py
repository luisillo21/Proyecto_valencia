from django.shortcuts import render,redirect
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from .models import *
from .forms import *
import hashlib
# Create your views here.


def inicio(request):
     if 'usuario' in request.session:
         contexto = {}
         menu_padre = Menu.objects.filter(tipo_menu = 'PADRE')
         datos_usuarios = Usuario.objects.get(id_usuario = request.session.get('usuario'))
         permisos = Permisos.objects.get(rol=datos_usuarios.rol_usuario)
         contexto['permisos'] = permisos
         contexto['lista_padre'] = menu_padre
         contexto['datos_usuario'] = datos_usuarios
         return render(request, 'index.html', contexto)
     else:
        return HttpResponseRedirect('salir/')


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
            else:
                contexto['error'] = "Usuario o contraseña incorrectos"
                return render(request, 'BASE/Login.html', contexto)   
    except Exception as e:
        contexto['error'] = e
        return render(request, 'BASE/Login.html', contexto)
    return render(request,'BASE/Login.html',contexto)

def usuarios(request):
    pass

def roles(request):
    pass

class Permiso(View):
    model = Permisos
    form_class = formPermisos
    template_name = 'permisos/permisos.html'

    def get_queryset(self):
        return self.model.objects.filter()

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['permisos'] = self.get_queryset()
        contexto['form'] = self.form_class
        return contexto
        
    def get(self,request,*args,**kwargs):
        return render(request,self.template_name,self.get_context_data())

    def post(self,request,*args,**kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            form.save()
            return redirect('seguridad:permisos')


def salir(request):
    del request.session['usuario']
    return HttpResponseRedirect('../')