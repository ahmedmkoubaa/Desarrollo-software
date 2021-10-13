
#include "ParteTrabajo.h"

ParteTrabajo::ParteTrabajo(int horasExtra, int costoMaterialesExtra, int costeDesplazamiento){
	setHorasExtra(horasExtra);
	setCostoMaterialesExtra(costoMaterialesExtra);
	setCosteDesplazamiento(costeDesplazamiento);
}

ParteTrabajo::ParteTrabajo(){
	
}

int ParteTrabajo::getHorasExtra() {
	return this->horasExtra;
}

void ParteTrabajo::setHorasExtra(int unHorasExtra) {
	this->horasExtra = unHorasExtra;
}

float ParteTrabajo::getCostoMaterialesExtra() {
	return this->costoMaterialesExtra;
}

void ParteTrabajo::setCostoMaterialesExtra(float unCostoMaterialesExtra) {
	this->costoMaterialesExtra = unCostoMaterialesExtra;
}

float ParteTrabajo::getCosteDesplazamiento() {
	return this->costeDesplazamiento;
}

void ParteTrabajo::setCosteDesplazamiento(float unCosteDesplazamiento) {
	this->costeDesplazamiento = unCosteDesplazamiento;
}

