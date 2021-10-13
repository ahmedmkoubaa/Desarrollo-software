
#ifndef __ParteTecnico_h__
#define __ParteTecnico_h__

#include "Trabajo.h"

class ParteTecnico
{
	private: int amabilidad;
	private: int profesionalidad;
	private: int eficacia;
	public: Trabajo* unnamed_Trabajo_;

	public: ParteTecnico();

	public: ParteTecnico(int amable, int profesional, int eficaz);

	public: int getAmabilidad();

	public: void setAmabilidad(int unAmabilidad);

	public: int getProfesionalidad();

	public: void setProfesionalidad(int unProfesionalidad);

	public: int getEficacia();

	public: void setEficacia(int unEficacia);
};

#endif
