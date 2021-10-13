#include <exception>
#include <string>
using namespace std;

#ifndef __Trabajo_h__
#define __Trabajo_h__

#include "Cliente.h"
#include "Tecnico.h"
#include "ParteTecnico.h"
#include "ParteTrabajo.h"

class ParteTrabajo;
class ParteTecnico;
class Cliente;
class Tecnico;

class Trabajo
{
private:
	Cliente* cliente;
	Tecnico* tecnico;
	ParteTecnico* parteTecnico;
	ParteTrabajo* parteTrabajo;

	string descripcion;
	bool hecho;
	float presupuesto;

public:
	Trabajo(const string & descripcion, Cliente * cliente_creador);
	string getDescripcion();
	void asignarTecnico(Tecnico * nuevo_tecnico);
	void realizado();

	void actualizarPresupuesto(float nuevo_presupuesto);
	void darParteTecnico(int amable, int profesional, int eficaz);
	void darParteTrabajo(int, int, int);
	float getPresupuesto();
	float setPresupuesto(const float & nuevoPresupuesto);
	Tecnico * getTecnico() const;

	ParteTecnico * getParteTecnico() const;
	ParteTrabajo * getParteTrabajo() const;
};

#endif
