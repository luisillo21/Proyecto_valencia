from django.shortcuts import render,redirect,render_to_response
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.http import HttpResponseRedirect, HttpResponse
from aula_virtual.apps.seguridad.models import Usuario
from .models import *
from .forms import *
from django.urls import reverse_lazy


# Create your views here.

#----Crud de Anexos

class Anexo_lst(ListView):
    model = Anexos
    queryset = model.objects.filter(estado='ACTIVO')
    template_name = 'anexos/anexos.html'

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            per = self.model.objects.filter(usuario=request.session.get('usuario'),estado='ACTIVO')
            return render(request, self.template_name, {'anexos':per})
        else:
            return redirect('seguridad:iniciar_sesion')


def anexo_lst(request):
    if 'usuario' in request.session:
        model = Usuario
        query_set = model.objects.filter(id_usuario=request.session.get('usuario'))
        template_name = 'anexos/anexos.html'
        return render(request,template_name,{'lst_anexos':query_set})
    else:
        return redirect('seguridad:iniciar_sesion')


class AddAnexos(CreateView):
    model = Anexos
    form_class = formAnexos
    template_name = 'anexos/agregar_anexos.html'
    success_url = reverse_lazy('asignacion:anexos')


class EditAnexos(UpdateView):
    model = Anexos
    form_class = formAnexos
    template_name = 'anexos/agregar_anexos.html'
    success_url = reverse_lazy('asignacion:anexos')


def eliminar_anexo(request, id):
    anexo = Anexos.objects.get(id_anexo=id)
    try:
        if request.method == 'POST':
            anexo.estado = 'INACTIVO'
            anexo.save()
            return redirect('asignacion:anexos')

    except Exception as e:
        return render(request, 'anexos/eliminar_anexo.html', {'error': e})

    return render(request, 'anexo/eliminar_anexo.html', {'anexo': anexo})