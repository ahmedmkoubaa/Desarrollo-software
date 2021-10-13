#include <exception>
using namespace std;

#ifndef __GestorFiltros_h__
#define __GestorFiltros_h__

#include "CadenaFiltros.h"
#include "Trabajo.h"
#include "Filtro.h"
#include "FiltroParteTecnico.h"
#include "FiltroParteTrabajo.h"

class CadenaFiltros;
class Trabajo;
class GestorFiltros;

class GestorFiltros
{
	public: CadenaFiltros* cadenaFiltros;

	public: GestorFiltros();

	public: void creaFiltroParteTrabajo();

	public: void creaFiltroParteTecnico();

	public: void filtrar(Trabajo * unTrabajo);
};

#endif
