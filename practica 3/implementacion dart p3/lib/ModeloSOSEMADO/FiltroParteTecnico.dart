import 'Filtro.dart';
import 'Trabajo.dart';
import 'ParteTecnico.dart';

class FiltroParteTecnico extends Filtro{
  void filtrar(Trabajo unTrabajo){
    const double extraTecnico = 0.05;

    ParteTecnico parte = unTrabajo.getParteTecnico();

    var amabilidad = parte.getAmabilidad();
    var profesional = parte.getProfesionalidad();
    var eficacia = parte.getEficacia();


    double mediaParte = ((amabilidad + profesional + eficacia)/3)/10 ;

    double presupuestoAntiguo = unTrabajo.getPresupuesto();
    double nuevoPresupuesto = presupuestoAntiguo * (1+extraTecnico*mediaParte);
    unTrabajo.setPresupuesto(nuevoPresupuesto);
  }
}