from .models import *

def permisos(request):
    if 'usuario' in request.session:
         contexto = {}
         menu_padre = Menu.objects.filter(tipo_menu = 'PADRE')
         datos_usuarios = Usuario.objects.get(id_usuario = request.session.get('usuario'))
         permisos = Permisos.objects.get(rol=datos_usuarios.rol_usuario)
         contexto['permisos'] = permisos
         contexto['lista_padre'] = menu_padre
         contexto['datos_usuario'] = datos_usuarios
         return contexto