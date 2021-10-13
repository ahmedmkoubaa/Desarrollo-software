
#ifndef __ParteTrabajo_h__
#define __ParteTrabajo_h__

#include "Trabajo.h"

class ParteTrabajo
{
	private: int horasExtra;
	private: float costoMaterialesExtra;
	private: float costeDesplazamiento;
	public: Trabajo* unnamed_Trabajo_;

	public: ParteTrabajo(int horasExtra, int costoMaterialesExtra, int costeDesplazamiento);

	public: ParteTrabajo();

	public: int getHorasExtra();

	public: void setHorasExtra(int unHorasExtra);

	public: float getCostoMaterialesExtra();

	public: void setCostoMaterialesExtra(float unCostoMaterialesExtra);

	public: float getCosteDesplazamiento();

	public: void setCosteDesplazamiento(float unCosteDesplazamiento);
};

#endif
