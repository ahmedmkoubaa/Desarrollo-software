import 'Trabajo.dart';
import 'Tecnico.dart';
import 'GestorFiltros.dart';

class Cliente{
  String nombre;
  int edad;
  Trabajo trabajo;

  Cliente(String nombre){
    this.nombre = nombre;
  }

  void defineTrabajo(String desc){
    trabajo = new Trabajo(desc, this);
  }

  String getNombre(){
    return nombre;
  }

  Trabajo getTrabajo(){
    return trabajo;
  }

  void pagar(){
    GestorFiltros gestor = new GestorFiltros();
    gestor.filtrar(trabajo);
  }

  void darParteTecnico(amable, profesional, eficaz){
    trabajo.darParteTecnico(amable, profesional, eficaz);
  }
}