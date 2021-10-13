import 'CadenaFiltros.dart';
import 'Trabajo.dart';
import 'Filtro.dart';
import 'FiltroParteTrabajo.dart';
import 'FiltroParteTecnico.dart';

class GestorFiltros{
  CadenaFiltros cadenaFiltros;

  GestorFiltros(){
    cadenaFiltros = new CadenaFiltros();
    creaFiltroParteTrabajo();
    crearFiltroParteTecnico();
  }

  void crearFiltroParteTecnico(){
    FiltroParteTecnico technicFilter = new FiltroParteTecnico();
    cadenaFiltros.listaFiltros.add(technicFilter as Filtro);
  }

  void creaFiltroParteTrabajo(){
    FiltroParteTrabajo workFilter = new FiltroParteTrabajo();
    cadenaFiltros.listaFiltros.add(workFilter as Filtro);
  }

  void filtrar(Trabajo unTrabajo){
    cadenaFiltros.filtrar(unTrabajo);
  }
}