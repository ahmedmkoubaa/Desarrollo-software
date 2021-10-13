#include <iostream>
// #include "Filtro.h"
// #include "ParteTecnico.h"
// #include "ParteTrabajo.h"
#include "Trabajo.h"
#include "Cliente.h"
#include "Tecnico.h"
#include "ParteTecnico.h"
#include "ParteTrabajo.h"
#include "CadenaFiltros.h"
#include "FiltroParteTecnico.h"
#include "FiltroParteTrabajo.h"
#include "GestorFiltros.h"


using namespace std;

void separador () {
	cout << endl << "---------------------------------------------------------------" << endl;
}

void pulsaTeclaParaSeguir(){
	cout << "Pulse cualquier tecla para continuar " << endl;
	const int TAM_LINEA_BASURA = 100;
	cin.ignore(TAM_LINEA_BASURA, '\n');
}


//----------------------------------------------------------------------------//
// lee de la entrada un entero entre min y max ambos incluidos,
// muestra antes el mensaje
int leerEnteroEnRango(int min, int max, string mensaje){
	bool correcto = false;
	int entero;

	while (!correcto){
		cout << mensaje;
		cin >> entero;
		correcto = (min <= entero && entero <= max);
	}

	return entero;
}

//----------------------------------------------------------------------------//
// Lee las respuestas del usuario y escribe en las referencias pasadas como parametros
void leerParteTecnico(int & amable, int & profesional, int & eficaz){
	const int MIN = 1;
	const int MAX = 10;
	const string ENUNCIADO = "\tResponda a cada pregunta con un numero entre 1 y 10\n\t";

	amable 		= leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Cómo de amable ha sido el tecnico?: ");
	profesional = leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Cómo de profesional ha sido el tecnico?: ");
	eficaz 		= leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Cómo de eficaz ha sido el tecnico?: ");
}

//----------------------------------------------------------------------------//
// Lee las respuestas del usuario y escribe en las referencias pasadas como parametros
void leerParteTrabajo(int & horas, int & material, int & desplazamiento){
	const int MIN = 1;
	const int MAX = 10;
	const string ENUNCIADO = "\tResponda a cada pregunta con un numero entre 1 y 10\n\t";

	horas 			= leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Ha empleado más horas de las previstas?: ");
	material 	   = leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Ha empleado más material del previsto?: ");
	desplazamiento = leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Ha gastado más en desplazamiento de lo previsto?: ");
}


int main () {
	string nombre_cliente, nombre_tecnico, descripcion_trabajo;
	float presupuesto_trabajo;

	cout << "PROGRAMA DE PRUEBA DE SOSEMADO" << endl;
	separador();

	//-------------------------------------------------------------------------//
	// CREAR NUEVO CLIENTE
	cout << "Vamos a añadir un nuevo cliente" << endl
	 	  << "Introduzca nombre del nuevo cliente: ";
	getline(cin, nombre_cliente);

	Cliente cliente(nombre_cliente);

	//-------------------------------------------------------------------------//
	// CREAR NUEVO TÉCNICO
	separador();
	cout << "Vamos a añadir nu nuevo técnico" << endl
	 	  << "Introduzca el nombre del nuevo tecnico: ";
	getline(cin, nombre_tecnico);

	Tecnico tecnico(nombre_tecnico);

	//-------------------------------------------------------------------------//
	// CREAR NUEVO TRABAJO
	separador();

	cout << "El cliente " << cliente.getNombre() << " va a añadir un nuevo trabajo"
		  << endl<< "Introduzca la descripcion del nuevo trabajo: ";
	getline(cin, descripcion_trabajo);

	cliente.defineTrabajo(descripcion_trabajo);

	//-------------------------------------------------------------------------//
	// ASIGNAR UN TECNICO A UN TRABAJO
	separador();
	Trabajo * trabajo = cliente.getTrabajo();

	cout << "Se va a asignar al trabajo " << descripcion_trabajo
		  << " el tecnico " << nombre_tecnico << endl;

	trabajo->asignarTecnico(&tecnico);
	pulsaTeclaParaSeguir();

	//-------------------------------------------------------------------------//
	// TECNICO DARÁ PRESUPUESTO
	cout << "Tecnico va a dar un presupuesto para " << descripcion_trabajo << endl
		  << "Introduzca una cantidad: ";
	cin >> presupuesto_trabajo;
	tecnico.darPresupuesto(presupuesto_trabajo);


	//-------------------------------------------------------------------------//
	// TECNICO REALIZARÁ UN TRABAJO

	separador();
	cout << "El tecnico " << nombre_tecnico << " va a realizar el trabajo "
		  << descripcion_trabajo << endl;

	tecnico.realizarTrabajo();
	pulsaTeclaParaSeguir();


	//-------------------------------------------------------------------------//
	// REALIZADO EL TRABAJO PROCEDEMOS A REALIZAR EL PARTE DEL TECNICO
	separador();
	cout << "Cliente va a dar parte del tecnico" << endl;
	int amable, profesional, eficaz;
	leerParteTecnico(amable, profesional, eficaz);

	cliente.darParteTecnico(amable, profesional, eficaz);

	//-------------------------------------------------------------------------//
	// REALIZADO EL TRABAJO PROCEDEMOS A REALIZAR EL PARTE DEL TRABAJO
	separador();
	cout << "Tecnico va a dar parte del trabajo" << endl;
	int horas, material, desplazamiento;
	leerParteTrabajo(horas, material, desplazamiento);

	tecnico.darParteTrabajo(horas, material, desplazamiento);


	//-------------------------------------------------------------------------//
	// CLIENTE VA A PAGAR A TÉCNICO
	cliente.pagar();

	cout << "Salio todo bien" << endl;


	return 0;
}
