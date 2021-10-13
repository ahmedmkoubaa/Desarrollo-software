import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:sosemadofinal/main.dart' as app;

void main() {
  group('App test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    
  testWidgets("Simulacion de utilizacion de inicio de sesion y utilizacion de la calculadora", (tester) async {
    app.main();
    await tester.pumpAndSettle();

    await new Future.delayed(const Duration(seconds : 5));
    final email = find.byKey(Key('Email'));
    final clave = find.byKey(Key('Contrasena'));
    final botonIniciarSesion=find.byKey(Key("inicioSesion"));
    

    await tester.enterText(email,'manu@gmail.com');
    expect(find.text('manu@gmail.com'), findsOneWidget);

    await tester.enterText(clave, '1234');
    expect(find.text('1234'), findsOneWidget);


    await tester.tap(botonIniciarSesion);
    await tester.pumpAndSettle();

    
    final botonCalculadora=find.byKey(Key("CalculadoraTecnico"));
    await tester.tap(botonCalculadora);
    await tester.pumpAndSettle();



    final calculadoraHoras = find.byKey(Key("CalculadoraHoras"));
    final calculadoraPrecioHora = find.byKey(Key("CalculadoraPrecioHora"));
    final calculadoraComplejidad = find.byKey(Key("CalculadoraComplejidad"));
    final calculadoraMaterial = find.byKey(Key("CalculadoraMaterial"));
    final calculadoraTransporte = find.byKey(Key("CalculadoraTransporte"));
    final calculadoraExtra = find.byKey(Key("CalculadoraExtra"));
    
    final botonCalcular = find.byKey(Key("Calcular"));

    await tester.enterText(calculadoraHoras, '20');
    expect(find.text('20'), findsOneWidget);
    await tester.enterText(calculadoraPrecioHora, '5');
    expect(find.text('5'), findsOneWidget);
    await tester.enterText(calculadoraComplejidad, '7');
    expect(find.text('7'), findsOneWidget);
    await tester.enterText(calculadoraMaterial, '200');
    expect(find.text('200'), findsOneWidget);
    await tester.enterText(calculadoraTransporte, '100');
    expect(find.text('100'), findsOneWidget);
    await tester.enterText(calculadoraExtra, '0');
    expect(find.text('0'), findsOneWidget);

    await tester.pumpAndSettle();

    await tester.tap(botonCalcular);

    await tester.pumpAndSettle();

  });
  
  });
}
