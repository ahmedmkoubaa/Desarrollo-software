import 'Trabajo.dart';

class Tecnico{
  String nombre;
  int edad, experiencia;
  Trabajo trabajo;

  Tecnico(nombre){
    this.nombre = nombre;
  }

  void darParteTrabajo(horas, material, desplazamiento){
    trabajo.darParteTrabajo(horas, material, desplazamiento);
  }

  void cobrar(Trabajo unTrabajo){
    var precioFinal = unTrabajo.getPresupuesto();
    print("El técnico ha cobrado ${precioFinal} €");
  }

  void cobrarCantidad(double cantidad){
    print("*Técnico cobrando ${cantidad} €");
  }

  void asignarTrabajo(Trabajo nuevo_trabajo){
    this.trabajo = nuevo_trabajo;
  }

  void realizarTrabajo(){
    if (trabajo != null) {
      print("*Realizando trabajo");
      trabajo.realizado();
    }
    else{
      print("El técnico no tiene trabajo todavía");
    }
  }

  void darPresupuesto(double presupuesto){
    trabajo.setPresupuesto(presupuesto);
  }

  String getNombre(){return this.nombre;}
}