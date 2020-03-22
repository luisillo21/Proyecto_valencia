from django.shortcuts import render,redirect
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
        return render(request, 'BASE/Login.html', contexto)   
    return render(request,'BASE/Login.html')

def salir(request):
    del request.session['usuario']
    return redirect('seguridad:inicio')



def usuarios(request):
    pass




class Permiso(View):
    model = Permisos
    form_class = formPermisos
    template_name = 'permisos/permisos.html'

    def get_queryset(self):
        return self.model.objects.filter(estado='ACTIVO')

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['per'] = self.get_queryset()
        print(contexto['per'])
        contexto['form'] = self.form_class
        return contexto
        
    def get(self,request,*args,**kwargs):
        return render(request,self.template_name,self.get_context_data())

    def post(self,request,*args,**kwargs):
        form = self.form_class(request.POST)
        if form.is_valid():
            form.save()
            return redirect('seguridad:permisos')



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

class Actualizarpermiso(UpdateView):
    model = Permisos
    form_class = formPermisos
    template_name = 'permisos/permisos.html'
    success_url = reverse_lazy('seguridad:permisos')

