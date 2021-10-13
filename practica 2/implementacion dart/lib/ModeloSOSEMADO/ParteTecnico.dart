import 'Trabajo.dart';

class ParteTecnico{
  int amabilidad, profesionalidad, eficacia;

  ParteTecnico(amable,profesional,eficaz){
      setAmabilidad(amable);
      setEficacia(eficaz);
      setProfesionalidad(profesional);
  }

  int getAmabilidad(){
    return this.amabilidad;
  }

  int getProfesionalidad(){
    return this.profesionalidad;
  }

  int getEficacia(){
    return this.eficacia;
  }

  void setAmabilidad(int amable){
    this.amabilidad = amable;
  }

  void setProfesionalidad(int profesional){
    this.profesionalidad = profesional;
  }

  void setEficacia(int eficaz){
    this.eficacia = eficaz;
  }
}