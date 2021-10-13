#include <exception>
#include <iostream>
using namespace std;

#include "Trabajo.h"
#include "Cliente.h"
#include "Tecnico.h"
#include "ParteTecnico.h"
#include "ParteTrabajo.h"

void Trabajo::actualizarPresupuesto(float unPrecio) {
	presupuesto = unPrecio ;
}

void Trabajo::darParteTecnico(int amabilidad, int profesionalidad, int eficacia) {
	if (parteTecnico == NULL){
		parteTecnico = new ParteTecnico(amabilidad,profesionalidad,eficacia);
	}
	else{
		parteTecnico->setAmabilidad(amabilidad);
		parteTecnico->setProfesionalidad(profesionalidad);
		parteTecnico->setEficacia(eficacia);
	}
}

void Trabajo::darParteTrabajo(int horasExtra, int materialesExtra, int desplazamiento) {
	if (parteTrabajo == NULL){
		parteTrabajo = new ParteTrabajo(horasExtra, materialesExtra, desplazamiento);
	}
	else{
		parteTrabajo->setCosteDesplazamiento(desplazamiento);
		parteTrabajo->setCostoMaterialesExtra(materialesExtra);
		parteTrabajo->setHorasExtra(horasExtra);
	}
}

float Trabajo::getPresupuesto(){
	return presupuesto;
}

Trabajo::Trabajo(const string & descripcion, Cliente * cliente_creador){
	this->descripcion = descripcion;
	this->cliente = cliente_creador;
	hecho = false;
}

string Trabajo::getDescripcion() {
	return descripcion;
}

Tecnico * Trabajo::getTecnico() const {
	return tecnico;
}

void Trabajo::asignarTecnico(Tecnico * nuevo_tecnico) {
	this->tecnico = nuevo_tecnico;
	nuevo_tecnico->asignarTrabajo(this);
}

void Trabajo::realizado(){
	if (tecnico) 	hecho = true;
	else cout << "El trabajo aun no tiene asignado un técnico" << endl;
}

ParteTecnico * Trabajo::getParteTecnico() const {
	return this->parteTecnico;
}

ParteTrabajo * Trabajo::getParteTrabajo() const {
	return this->parteTrabajo;
}

float Trabajo::setPresupuesto(const float & nuevoPresupuesto) {
	return this->presupuesto = nuevoPresupuesto;
}
