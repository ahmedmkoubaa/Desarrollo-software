#include <exception>
using namespace std;

#include "FiltroParteTrabajo.h"
#include "Trabajo.h"
#include "Filtro.h"

void FiltroParteTrabajo::filtrar(Trabajo * unTrabajo) {
	const float extraTrabajo = 0.1;		// Porcentaje extra por trabajo bien hecho

	ParteTrabajo * parte = unTrabajo->getParteTrabajo();

	int horas 			 = parte->getHorasExtra();
	int material 		 = parte->getCostoMaterialesExtra();
	int desplazamiento = parte->getCosteDesplazamiento();

	float mediaParte = ((horas + desplazamiento + material)/3)/10; // dividimos entre 10 para normalizar (0-1)

	float presupuestoAntiguo = unTrabajo->getPresupuesto();
	float nuevoPresupuesto = presupuestoAntiguo + (presupuestoAntiguo*extraTrabajo) * mediaParte;

	/*Al presupuesto antiguo le sumamos como mucho el 10% de su valor anterior (extraTrabajo)
	  la cantidad exacta a sumar vendra determinada por la media del parte, es decir, si la media
	  es un 10, entonces le sumaremos el 10% al completo
	*/

	unTrabajo->setPresupuesto(nuevoPresupuesto);
	// cout << "Filtrando trabajo nuevoPresupuesto " << nuevoPresupuesto << endl;
}
