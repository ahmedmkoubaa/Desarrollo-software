
#include "ParteTecnico.h"

ParteTecnico::ParteTecnico(){}

ParteTecnico::ParteTecnico(int amable, int profesional, int eficaz){
	setAmabilidad(amable);
	setProfesionalidad(profesional);
	setEficacia(eficaz);
}

int ParteTecnico::getAmabilidad() {
	return this->amabilidad;
}

void ParteTecnico::setAmabilidad(int unAmabilidad) {
	this->amabilidad = unAmabilidad;
}

int ParteTecnico::getProfesionalidad() {
	return this->profesionalidad;
}

void ParteTecnico::setProfesionalidad(int unProfesionalidad) {
	this->profesionalidad = unProfesionalidad;
}

int ParteTecnico::getEficacia() {
	return this->eficacia;
}

void ParteTecnico::setEficacia(int unEficacia) {
	this->eficacia = unEficacia;
}

