#include <exception>
#include <string>
using namespace std;

#ifndef __Tecnico_h__
#define __Tecnico_h__

#include "Trabajo.h"
class Trabajo;

class Tecnico
{
private:
	string nombre;
	int edad;
	int experiencia;
	Trabajo * trabajo;

public:
	Tecnico(string nombre_tecnico);
	string getNombre();
	void asignarTrabajo(Trabajo * nuevo_trabajo);
	void realizarTrabajo();
	void darPresupuesto(const float & presupuesto);
	void cobrar(const float cantiddad);

	public: void cobrar(Trabajo unTrabajo);
	public: void darParteTrabajo(const int & horas,
			const int & material, const int & desplazamiento);
};

#endif
