import 'Trabajo.dart';
import 'Filtro.dart';
import 'ParteTrabajo.dart';

class FiltroParteTrabajo extends Filtro{
  @override
  void filtrar(Trabajo unTrabajo) {
    const double extraTrabajo = 0.1;

    ParteTrabajo parte = unTrabajo.getParteTrabajo();

    int horas = parte.getHorasExtra();
    int material = parte.getCosteMaterialesExtra();
    int desplazamiento = parte.getCosteDesplazamiento();

    double mediaParte = ((horas+material+desplazamiento)/3)/10;

    double presupuestoAntiguo = unTrabajo.getPresupuesto();
    double nuevoPresupuesto = presupuestoAntiguo * (1+extraTrabajo*mediaParte);

    unTrabajo.setPresupuesto(nuevoPresupuesto);
  }
}