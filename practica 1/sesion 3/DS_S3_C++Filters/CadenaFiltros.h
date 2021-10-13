#include <exception>
using namespace std;

#ifndef __CadenaFiltros_h__
#define __CadenaFiltros_h__

#include "GestorFiltros.h"
#include "Filtro.h"
#include "Trabajo.h"
#include <vector>

class CadenaFiltros
{

	public: vector<Filtro *> listaFiltros;

	public: void filtrar(Trabajo * unTrabajo);
};

#endif
