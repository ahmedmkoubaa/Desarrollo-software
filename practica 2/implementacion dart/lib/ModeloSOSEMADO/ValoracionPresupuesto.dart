import 'package:ds_practica2/ModeloSOSEMADO/Presupuesto.dart';

class ValoracionPresupuesto {
  String _descripcionValoracion;
  Presupuesto _presupuestoIdeal;
  int _valoracion;

  ValoracionPresupuesto(descripcion, presupuestoIdeal, valoracion) {
    this._descripcionValoracion = descripcion;
    this._presupuestoIdeal = presupuestoIdeal;
    this._valoracion = valoracion;
  }

  String getDescripcion() {
    return _descripcionValoracion;
  }

  Presupuesto getPresupuestoIdeal() {
    return _presupuestoIdeal;
  }

  int getValoracion() {
    return _valoracion;
  }
}
