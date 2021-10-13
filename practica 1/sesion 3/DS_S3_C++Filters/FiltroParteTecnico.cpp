#include <exception>
using namespace std;

#include "FiltroParteTecnico.h"
#include "Trabajo.h"
#include "Filtro.h"

void FiltroParteTecnico::filtrar(Trabajo * unTrabajo) {
	const float extraTecnico = 0.05;			// Porcentaje extra que se da si el tecnico fue bueno

	ParteTecnico * parte = unTrabajo->getParteTecnico();

	int amabilidad	 = parte->getAmabilidad();
	int profesional = parte->getProfesionalidad();
	int eficacia 	 = parte->getEficacia();

	float mediaParte = ((amabilidad + profesional + eficacia)/3)/10;	// Dividir entre 10 para normalizar media (0 -1)

	float presupuestoAntiguo = unTrabajo->getPresupuesto();
	float nuevoPresupuesto = presupuestoAntiguo + (presupuestoAntiguo*extraTecnico) * mediaParte;

	/*Al presupuesto antiguo le sumamos como mucho el 10% de su valor anterior (extraTrabajo)
	  la cantidad exacta a sumar vendra determinada por la media del parte, es decir, si la media
	  es un 10, entonces le sumaremos el 10% al completo
	*/

	unTrabajo->setPresupuesto(nuevoPresupuesto);
}
