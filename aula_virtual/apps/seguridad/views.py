from django.shortcuts import render,redirect
from .models import *
import hashlib
# Create your views here.


def inicio(request):
     if 'usuario' in request.session:
         contexto = {}
         menu_padre = Menu.objects.filter(tipo_menu = 'PADRE')
         datos_usuarios = Usuario.objects.get(id_usuario = request.session.get('usuario'))
         permisos = Permisos.objects.get(rol=datos_usuarios.rol_usuario)
         contexto['permisos'] = permisos
         print(permisos)
         contexto['lista_padre'] = menu_padre
         contexto['datos_usuario'] = datos_usuarios
         #permiso = Menu.objects.filter(
         #    fk_permiso_modmenu__id_rol__fk_rol__id_usuario=request.session.get('usuario'), id_genr_estado=97).values()
         #usuario = ConfUsuario.objects.get(
         #    id_usuario=request.session.get('usuario'))
         #contexto['permisos'] = permiso
         #contexto['info_usuario'] = usuario
         return render(request, 'index.html', contexto)
     else:
        return HttpResponseRedirect('salir/')


def login(request):
    contexto = {}
    try:
        if request.method == 'POST':
            var_usuario = request.POST.get('usu')
            var_contra = request.POST.get('pass')
            #h = hashlib.new("sha1")
            #var_contra = str.encode(var_contra)
            #h.update(var_contra)
            #print(h.hexdigest())
            #usu = Usuario.objects.get(
            #    usuario=var_usuario, clave=h.hexdigest(), estado='ACTIVO')
            
            
            usu = Usuario.objects.get(
                usuario=var_usuario, clave=var_contra, estado='ACTIVO')
            
            print(usu)
            
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


def salir(request):
    del request.session['usuario']
    return HttpResponseRedirect('../')