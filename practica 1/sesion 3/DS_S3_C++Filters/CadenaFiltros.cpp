#include <exception>
using namespace std;

#include "CadenaFiltros.h"
#include "GestorFiltros.h"
#include "Filtro.h"
#include "Trabajo.h"

void CadenaFiltros::filtrar(Trabajo * unTrabajo) {
	vector<Filtro *>::iterator iter ;
	for (iter = listaFiltros.begin() ; iter != listaFiltros.end() ; iter++)
	{
		Filtro* filtro = *iter;
		filtro->filtrar(unTrabajo);
	}

	// Llamar en la cadena al target
	unTrabajo->getTecnico()->cobrar(unTrabajo->getPresupuesto());
}
