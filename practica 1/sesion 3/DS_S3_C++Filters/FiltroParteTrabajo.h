#include <exception>
using namespace std;

#ifndef __FiltroParteTrabajo_h__
#define __FiltroParteTrabajo_h__

#include "Trabajo.h"
#include "Filtro.h"


class FiltroParteTrabajo: public Filtro
{

	public: void filtrar(Trabajo * unTrabajo);
};

#endif
