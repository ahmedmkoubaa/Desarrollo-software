import 'GestorFiltros.dart';
import 'Trabajo.dart';
import 'Filtro.dart';

class CadenaFiltros{
  List<Filtro> listaFiltros = [];

  void filtrar(unTrabajo){
    listaFiltros.forEach((element){
      element.filtrar(unTrabajo);
    });
  }
}