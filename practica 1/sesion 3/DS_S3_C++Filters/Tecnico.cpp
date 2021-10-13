#include <exception>
#include <iostream>
using namespace std;

#include "Tecnico.h"

using namespace std;

Tecnico::Tecnico(string nombre_tecnico) {
	this->nombre = nombre_tecnico;
}

void Tecnico::cobrar(Trabajo unTrabajo) {
	float precioFinal = unTrabajo.getPresupuesto();
	cout << "El técnico ha cobrado " << precioFinal << " €." << endl ;
}

void Tecnico::darPresupuesto(const float & presupuesto){
	trabajo->setPresupuesto(presupuesto);
}

void Tecnico::cobrar(const float cantidad) {
	cout << "*Tecnico cobrando " << cantidad << " euros*" << endl;
}

void Tecnico::darParteTrabajo(
	const int & horas, const int & material, const int & desplazamiento){

	trabajo->darParteTrabajo(horas, material, desplazamiento);
}

string Tecnico::getNombre() { return this->nombre; }

void Tecnico::asignarTrabajo(Trabajo * nuevo_trabajo) {
	this->trabajo = nuevo_trabajo;
}

void Tecnico::realizarTrabajo(){
	if (trabajo) {
		cout << "*realizando trabajo*" << endl;
		trabajo->realizado();
	} else {
		cout << "tecnico no tiene ningun trabajo todavia" << endl;
	}
}
