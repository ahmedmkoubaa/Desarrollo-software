import 'dart:ffi';

import 'Trabajo.dart';
import 'Cliente.dart';
import 'Tecnico.dart';
import 'ParteTrabajo.dart';
import 'ParteTecnico.dart';
import 'CadenaFiltros.dart';
import 'FiltroParteTecnico.dart';
import 'FiltroParteTrabajo.dart';
import 'GestorFiltros.dart';
import 'dart:io';

class Main{
  int horas, material, desplazamiento, amable, profesional, eficaz;
  void separador(){
    print("---------------------------------------------------------------\n");
  }

  void pulsaTeclaParaSeguir(){
    print("Pulse cualquier tecla para continuar \n");
  }

  int leerEnteroEnRango(int min, int max, String mensaje){
    bool correcto = false;
    int entero;

    while(!correcto){
      print(mensaje);
      String points = stdin.readLineSync();
      entero = int.parse(points);
      correcto = (min <= entero && entero <= max);
    }

    return entero;
  }

  void leerParteTecnico(){
    const int MIN = 1;
    const int MAX = 10;
    const String ENUNCIADO = "\tResponda a cada pregunta con un numero entre 1 y 10\n\t";

    amable 		= leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Cómo de amable ha sido el tecnico?: ");
    profesional = leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Cómo de profesional ha sido el tecnico?: ");
    eficaz 		= leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Cómo de eficaz ha sido el tecnico?: ");
  }

  void leerParteTrabajo(){
    const int MIN = 1;
    const int MAX = 10;
    const String ENUNCIADO = "\tResponda a cada pregunta con un numero entre 1 y 10\n\t";

    horas 			= leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Ha empleado más horas de las previstas?: ");
    material 	   = leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Ha empleado más material del previsto?: ");
    desplazamiento = leerEnteroEnRango(MIN, MAX, ENUNCIADO + "¿Ha gastado más en desplazamiento de lo previsto?: ");
  }

  int main(){
    print("PROGRAMA DE PRUEBA DE SOSEMADO");
    separador();

    print("Vamos a añadir un nuevo cliente.\n Introduzca nombre del nuevo cliente:\n");
    String nombreCliente = stdin.readLineSync();
    Cliente cliente = new Cliente(nombreCliente);
    separador();

    print("Vamos a añadir un nuevo técnico.\n Introduzca nombre del nuevo técnico:\n");
    String nombreTecnico = stdin.readLineSync();
    Tecnico tecnico = new Tecnico(nombreTecnico);
    separador();

    print("El cliente ${cliente.getNombre()} va a añadir un nuevo trabajo.\n Introduzca la descripción del trabajo:\n");
    String desc = stdin.readLineSync();
    cliente.defineTrabajo(desc);
    separador();

    Trabajo trabajo = cliente.getTrabajo();
    print("Se va a asignar al Trabajo ${trabajo.getDescripcion()} el Técnico ${tecnico.getNombre()} \n");
    trabajo.asignarTecnico(tecnico);
    pulsaTeclaParaSeguir();
    separador();

    print("El técnico va a dar un presupuesto para ${trabajo.getDescripcion()}.\n Introduce una cantidad:\n");
    String precio = stdin.readLineSync();
    double precioNum = int.parse(precio) * 1.0;
    tecnico.darPresupuesto(precioNum);
    separador();

    print("El técnico ${tecnico.getNombre()} va a realizar el trabajo ${trabajo.getDescripcion()}\n");
    tecnico.realizarTrabajo();
    pulsaTeclaParaSeguir();
    separador();

    print("El cliente va a dar parte de satisfacción del Técnico\n");
    leerParteTecnico();
    cliente.darParteTecnico(amable, profesional, eficaz);
    separador();

    print("El Técnico va a dar parte del Trabajo\n");
    leerParteTrabajo();
    tecnico.darParteTrabajo(horas, material, desplazamiento);
    separador();

    cliente.pagar();
    print("Si ha llegado hasta aquí, es que todo ha salido bien. Saliendo del programa...\n");




    return 0;
  }
}

main(){
  Main main = new Main();
  main.main();
}