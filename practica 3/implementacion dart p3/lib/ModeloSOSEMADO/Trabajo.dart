import 'Cliente.dart';
import 'Tecnico.dart';
import 'ParteTecnico.dart';
import 'ParteTrabajo.dart';

class Trabajo {
  Cliente cliente;
  Tecnico tecnico;
  ParteTrabajo parteTrabajo;
  ParteTecnico parteTecnico;

  String descripcion;
  bool hecho;
  double presupuesto;

  Trabajo(String desc, Cliente clienteCreador) {
    this.descripcion = desc;
    this.cliente = clienteCreador;
  }

  void asignarTecnico(Tecnico nuevoTecnico) {
    tecnico = nuevoTecnico;
    nuevoTecnico.asignarTrabajo(this);
  }

  void realizado() {
    if (tecnico != null) {
      hecho = true;
    } else {
      print("El trabajo no tiene asignado un técnico\n");
    }
  }

  void setPresupuesto(double nuevoPresupuesto) {
    presupuesto = nuevoPresupuesto;
  }

  void darParteTecnico(int amable, int profesional, int eficaz) {
    if (parteTecnico != null) {
      parteTecnico.setAmabilidad(amable);
      parteTecnico.setProfesionalidad(profesional);
      parteTecnico.setEficacia(eficaz);
    } else {
      parteTecnico = new ParteTecnico(amable, profesional, eficaz);
    }
  }

  void darParteTrabajo(
      int horas, int costoMateriales, int costoDesplazamiento) {
    if (parteTrabajo != null) {
      parteTrabajo.setHorasExtra(horas);
      parteTrabajo.setCosteMaterialesExtra(costoMateriales);
      parteTrabajo.setCosteDesplazamiento(costoDesplazamiento);
    } else {
      parteTrabajo =
          new ParteTrabajo(horas, costoMateriales, costoDesplazamiento);
    }
  }

  double getPresupuesto() {
    return presupuesto;
  }

  String getDescripcion() {
    return descripcion;
  }

  Tecnico getTecnico() {
    return tecnico;
  }

  ParteTecnico getParteTecnico() {
    return parteTecnico;
  }

  ParteTrabajo getParteTrabajo() {
    return parteTrabajo;
  }
}
