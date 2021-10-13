import 'Trabajo.dart';

class ParteTrabajo{
  int horasExtra, costoMaterialesExtra, costeDesplazamiento;
  ParteTrabajo(int horas, int costoMateriales, int costoDesplazamiento){
    setCosteDesplazamiento(costoDesplazamiento);
    setCosteMaterialesExtra(costoMateriales);
    setHorasExtra(horas);
  }

  int getHorasExtra(){
    return this.horasExtra;
  }

  void setHorasExtra(int horas){
   this.horasExtra = horas;
  }

  int getCosteMaterialesExtra(){
    return this.costoMaterialesExtra;
  }

  void setCosteMaterialesExtra(int costoMateriales){
    this.costoMaterialesExtra = costoMateriales ;
  }

  int getCosteDesplazamiento(){
    return this.costeDesplazamiento;
  }

  void setCosteDesplazamiento(int costoDesplazamiento){
     this.costeDesplazamiento = costoDesplazamiento;
  }
}