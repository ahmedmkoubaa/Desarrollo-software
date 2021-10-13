// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sosemadofinal/main.dart';
import 'package:sosemadofinal/tecnico.dart';

void main() {
  testWidgets('Hay cuatro botones en el perfil tecnico',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      title: 'Sosemado',
      home: PerfilTecnico(),
    ));
    
    expect(find.byKey(Key("CalculadoraTecnico")), findsOneWidget);
    expect(find.byKey(Key("ModificarTecnico")), findsOneWidget);
    expect(find.byKey(Key("EliminarCuenta")), findsOneWidget);
    expect(find.byKey(Key("ConsultarTrabajos")), findsOneWidget);
  });

  testWidgets('Los campos de calculadora presupuesto estan bien rellenados', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      title: 'Sosemado',
      home: RutaCalculadora(),
    ));

    await tester.enterText(find.byKey(Key("CalculadoraHoras")), '20');
    expect(find.text('20'), findsOneWidget);

    await tester.enterText(find.byKey(Key("CalculadoraPrecioHora")), '5');
    expect(find.text('5'), findsOneWidget);

    await tester.enterText(find.byKey(Key("CalculadoraComplejidad")), '7');
    expect(find.text('7'), findsOneWidget);

    await tester.enterText(find.byKey(Key("CalculadoraMaterial")), '200');
    expect(find.text('200'), findsOneWidget);

    await tester.enterText(find.byKey(Key("CalculadoraTransporte")), '100');
    expect(find.text('100'), findsOneWidget);

    await tester.enterText(find.byKey(Key("CalculadoraExtra")), '0');
    expect(find.text('0'), findsOneWidget);

  });

  

  testWidgets('Comprobar que los valores del perfil estan rellenados correctamente', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      title: 'Sosemado',
      home: PerfilTecnico(),
    ));
    
    expect(find.text("Nombre: "), findsOneWidget);
    expect(find.text(tecnicoIdentificado.nombre+" "+tecnicoIdentificado.apellidos), findsOneWidget);
    expect(find.text("Email: "), findsOneWidget);
    expect(find.text(tecnicoIdentificado.getEmail()), findsOneWidget);
    expect(find.text("Especialidad: "), findsOneWidget);
    expect(find.text(tecnicoIdentificado.getEspecialidad()), findsOneWidget);
    expect(find.text("Valoracion: "), findsOneWidget);
    expect(find.text(tecnicoIdentificado.getValoracion().toString()), findsOneWidget);

  });
  
}
