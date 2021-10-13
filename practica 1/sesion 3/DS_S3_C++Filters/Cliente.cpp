#include <exception>
#include <iostream>
using namespace std;

#include "Cliente.h"
#include "GestorFiltros.h"

void Cliente::pagar() {
	GestorFiltros gestor;
	gestor.filtrar(this->trabajo);
}


void Cliente::darParteTecnico(const int & amable,
	 	const int & profesional, const int & eficaz){

		trabajo->darParteTecnico(amable, profesional, eficaz);
}

Cliente::Cliente(string nombre_cliente) {
	this->nombre = nombre_cliente;
}

void Cliente::defineTrabajo(string & descripcion) {
	trabajo = new Trabajo(descripcion, this);
}

string Cliente::getNombre() {
	return this->nombre;
}

Trabajo * Cliente::getTrabajo() { return trabajo; }
