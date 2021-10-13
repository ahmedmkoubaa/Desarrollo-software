class Presupuesto {
  static final double _precioPorHora = 10;
  double duracion;
  double costeMaterial;
  int complejidad;
  double costeDesplazamiento;
  double costePersonalExtra;

  Presupuesto(){
    duracion = costeMaterial = costeDesplazamiento = costePersonalExtra = -1;
    complejidad = -1;
  }

  double total() {
    double subtotal = costeMaterial + costeDesplazamiento + costePersonalExtra;
    subtotal += _precioPorHora * duracion;
    subtotal += 0.05 * (complejidad / 5) * subtotal;

    return subtotal;
  }
}
