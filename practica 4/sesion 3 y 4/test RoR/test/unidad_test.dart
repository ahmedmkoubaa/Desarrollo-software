import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sosemadofinal/tecnico.dart';
import 'package:sosemadofinal/trabajo.dart';
import 'package:sosemadofinal/Presupuesto.dart';
import 'package:sosemadofinal/propuesta.dart';
import 'package:sosemadofinal/main.dart';

void main() {
  group('Test unidad', () {
    test('Constructor crea un tecnico con los valores indicados', () {
      final tecnico = new Tecnico(1, "Santiago", "Muñoz Castro", "12345", 5, 0,
          "santiyagito22@gmail.com", "PINTURA");
      expect(tecnico.nombre, "Santiago");
      expect(tecnico.apellidos, "Muñoz Castro");
      expect(tecnico.contrasena, "12345");
      expect(tecnico.valoracion, 5);
      expect(tecnico.numTrabajos, 0);
      expect(tecnico.email, "santiyagito22@gmail.com");
      expect(tecnico.tipoTecnico, "PINTURA");
    });

    test('Constructor crea un trabajo con los valores indicados', () {
      final trabajo = new Trabajo(2, "Reformar los cuartos de baño",
          "Calle del Sol, Granada", 500, "REFORMA", 1);
      expect(trabajo.id, 2);
      expect(trabajo.descripcion, "Reformar los cuartos de baño");
      expect(trabajo.localizacion, "Calle del Sol, Granada");
      expect(trabajo.presupuesto, 500);
      expect(trabajo.tipoTrabajo, "REFORMA");
      expect(trabajo.idTecnico, 1);
    });

    test('Constructor crea una propuesta con los valores indicados', () {
      final propuesta = new Propuesta(3, 1, 2, "PENDIENTE", 500);
      expect(propuesta.id, 3);
      expect(propuesta.idTecnico, 1);
      expect(propuesta.idTrabajo, 2);
      expect(propuesta.estado, "PENDIENTE");
      expect(propuesta.presupuesto, 500);
    });

    test('Constructor crea un presupuesto con los valores indicados', () {
      final pres = new Presupuesto(10, 200, 7, 50, 100, 6);
      expect(pres.precioHora, 6);
      expect(pres.material, 200);
      expect(pres.duracion, 10);
      expect(pres.gastosPersonalExtra, 100);
      expect(pres.complejidad, 7);
      expect(pres.desplazamiento, 50);
    });

    test('Probar funcionamiento correcto del metodo total', () {
      final pres = new Presupuesto(10, 200, 7, 50, 100, 6);
      double tot = pres.total();
      expect(tot, 480);
    });

    test('Probar funcionamiento correcto del metodo checkUsuario', () {
      List<Tecnico> lista = new List<Tecnico>();

      lista.add(new Tecnico(1, "Santiago", "Muñoz Castro", "12345", 5, 0,
          "santiyagito22@gmail.com", "PINTURA"));
      lista.add(new Tecnico(2, "Francisco", "Jimenez Legaza", "1234", 4, 1,
          "flegaza@hotmail.es", "REFORMA"));
      lista.add(new Tecnico(2, "Raul", "Rodriguez Perez", "12345", 3, 1,
          "canarioMortarron@gmail.com", "REFORMA"));

      bool noRegistrado = checkUsuario(lista, "yoli@gmail.com");
      expect(noRegistrado, false);
      bool Registrado = checkUsuario(lista, "flegaza@hotmail.es");
      expect(Registrado, true);

    });
  });
}
