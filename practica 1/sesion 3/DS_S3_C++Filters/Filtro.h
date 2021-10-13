#include <exception>
using namespace std;

#ifndef __Filtro_h__
#define __Filtro_h__

#include "Trabajo.h"

class Trabajo;
class Filtro;

class Filtro
{
	public: virtual void filtrar(Trabajo * unTrabajo) = 0;
};

#endif
