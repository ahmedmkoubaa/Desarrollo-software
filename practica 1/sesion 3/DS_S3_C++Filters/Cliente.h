#include <exception>
#include <string>
using namespace std;

#ifndef __Cliente_h__
#define __Cliente_h__

#include "Trabajo.h"
#include "Tecnico.h"
#include <vector>

class Trabajo;
class Cliente;

class Cliente {
private:
	string nombre;
	int edad;
	Trabajo * trabajo;

public:
	Cliente(string nombre);
	void defineTrabajo(string & descripcion);
	string getNombre();

	Trabajo * getTrabajo();
	void pagar();
	void darParteTecnico(const int & amable, const int & profesional, const int & eficaz);
};

#endif
