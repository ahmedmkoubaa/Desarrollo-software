#include <exception>
using namespace std;

#include "GestorFiltros.h"

GestorFiltros::GestorFiltros(){
	cadenaFiltros = new CadenaFiltros();
	creaFiltroParteTecnico();
	creaFiltroParteTrabajo();
}

void GestorFiltros::creaFiltroParteTecnico() {
	FiltroParteTecnico *technicFilter = new FiltroParteTecnico();
	cadenaFiltros->listaFiltros.push_back(technicFilter);
}

void GestorFiltros::creaFiltroParteTrabajo() {
	FiltroParteTrabajo *workFilter = new FiltroParteTrabajo();
	cadenaFiltros->listaFiltros.push_back(workFilter);
}

void GestorFiltros::filtrar(Trabajo * unTrabajo) {
	cadenaFiltros->filtrar(unTrabajo);
	// llamar desde gestor filtros al target ???
	// unTrabajo->getTecnico()->cobrar(unTrabajo->getPresupuesto());
}
