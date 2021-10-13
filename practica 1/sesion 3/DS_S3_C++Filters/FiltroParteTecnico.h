#include <exception>
using namespace std;

#ifndef __FiltroParteTecnico_h__
#define __FiltroParteTecnico_h__

#include "Trabajo.h"
#include "Filtro.h"

class Trabajo;
class FiltroParteTecnico;

class FiltroParteTecnico: public Filtro
{

	public: void filtrar(Trabajo * unTrabajo);
};

#endif
