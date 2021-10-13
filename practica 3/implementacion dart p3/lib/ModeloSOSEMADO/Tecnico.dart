import 'package:ds_practica2/ModeloSOSEMADO/Presupuesto.dart';
import 'package:ds_practica2/ModeloSOSEMADO/ValoracionPresupuesto.dart';
import 'Trabajo.dart';

class Tecnico {
  String nombre;
  int edad, experiencia;
  Trabajo trabajo;

  static int mediaComplejidad = 4;
  static double mediaCosteDesplzamiento = 9.12;
  static double mediaCosteMaterial = 213.12;
  static double mediaCostePersonalExtra = 120.93;
  static double mediaDuracion = 4.5;

  Tecnico(nombre) {
    this.nombre = nombre;
  }

  void darParteTrabajo(horas, material, desplazamiento) {
    trabajo.darParteTrabajo(horas, material, desplazamiento);
  }

  void cobrar(Trabajo unTrabajo) {
    var precioFinal = unTrabajo.getPresupuesto();
    print("El técnico ha cobrado ${precioFinal} €");
  }

  void cobrarCantidad(double cantidad) {
    print("*Técnico cobrando ${cantidad} €");
  }

  void asignarTrabajo(Trabajo nuevo_trabajo) {
    this.trabajo = nuevo_trabajo;
  }

  void realizarTrabajo() {
    if (trabajo != null) {
      print("*Realizando trabajo");
      trabajo.realizado();
    } else {
      print("El técnico no tiene trabajo todavía");
    }
  }

  void darPresupuesto(double presupuesto) {
    trabajo.setPresupuesto(presupuesto);
  }

  String getNombre() {
    return this.nombre;
  }

  ValoracionPresupuesto asistentePresupuesto(Presupuesto presupuesto) {
    int valoracion = 0;

    String mensaje = "Le aconsejamos:\n";
    Presupuesto presupuestoResultado = presupuesto;

    if (presupuesto.complejidad > Tecnico.mediaComplejidad) {
      presupuestoResultado.complejidad = Tecnico.mediaComplejidad;
      valoracion--;
    }

    if (presupuesto.costeDesplazamiento > Tecnico.mediaCosteDesplzamiento) {
      presupuestoResultado.costeDesplazamiento =
          Tecnico.mediaCosteDesplzamiento;
      valoracion--;
      mensaje += "    --> reducir el coste de desplazamiento\n";
    }

    if (presupuesto.costeMaterial > Tecnico.mediaCosteMaterial) {
      presupuestoResultado.costeMaterial = Tecnico.mediaCosteMaterial;
      valoracion--;
      mensaje += "    -->  reducir el coste de materiales\n";
    }

    if (presupuesto.costePersonalExtra > Tecnico.mediaCostePersonalExtra) {
      presupuestoResultado.costePersonalExtra = Tecnico.mediaCostePersonalExtra;
      valoracion--;
      mensaje += "    -->  reducir el coste de personal extra\n";
    }

    if (presupuesto.duracion > Tecnico.mediaDuracion) {
      presupuestoResultado.duracion = Tecnico.mediaDuracion;
      valoracion--;
      mensaje += "    -->  reducir duración\n";
    }

    mensaje += "\n";
    switch (valoracion) {
      case 0:
        mensaje = "Su presupuesto es realmente bueno";
        break;
      case -1:
        mensaje += "Buen presupuesto";
        break;
      case -2:
        mensaje += "Su presupuesto es mejorable";
        break;
      case -3:
        mensaje += "Debería corregir algunos aspectos de su presupuesto";
        break;
      case -4:
        mensaje += "Su prosupuesto es poco competente";
        break;
      default:
        mensaje +=
            "Este presupuesto se aleja bastante de la media, debería corregirlo";
        break;
    }

    mensaje += "\n";

    return ValoracionPresupuesto(mensaje, presupuestoResultado, valoracion);
  }
}
