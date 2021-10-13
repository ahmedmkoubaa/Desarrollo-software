import 'package:ds_practica2/VistaTecnico/AplicacionTecnicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Tocar botón activo', (WidgetTester tester) async {
    await tester.pumpWidget(AplicacionTecnicos());
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));
    ElevatedButton boton = find
        .widgetWithText(ElevatedButton, 'Calcular Presupuesto')
        .evaluate()
        .first
        .widget;
    boton.onPressed();
    await tester.pumpAndSettle();

    expect(find.text("SOSEMADO Technical View"), findsNothing);
    expect(find.text("Calculadora de presupuestos"), findsOneWidget);
  });

  testWidgets('Calcular rellenando campos', (WidgetTester tester) async {
    await tester.pumpWidget(AplicacionTecnicos());
    await tester.pumpAndSettle();
    ElevatedButton boton = find
        .widgetWithText(ElevatedButton, 'Calcular Presupuesto')
        .evaluate()
        .first
        .widget;
    boton.onPressed();
    await tester.pumpAndSettle();

    expect(find.text("SOSEMADO Technical View"), findsNothing);
    expect(find.text("Calculadora de presupuestos"), findsOneWidget);
    await tester.pump(Duration(seconds: 2));
    await tester.tap((find.text('Duración')));
    await tester.enterText(find.byKey(Key('desc')), '340');
    await tester.pump(Duration(seconds: 1));
    await tester.tap(find.text('Coste de los materiales'));
    await tester.enterText(find.byKey(Key('cm')), '965.01');
    await tester.pump(Duration(seconds: 1));
    await tester.tap(find.text('Coste de Desplazamiento'));
    await tester.enterText(find.byKey(Key('cd')), '1000.01');
    await tester.pump(Duration(seconds: 1));
    await tester.tap(find.text('Coste de Personal Extra'));
    await tester.enterText(find.byKey(Key('cp')), '450.43');
    await tester.pump(Duration(seconds: 1));
    await tester.tap(find.text('Complejidad'));
    await tester.enterText(find.byKey(Key('comp')), '4');
    await tester.pump(Duration(seconds: 1));
    boton =
        find.widgetWithText(ElevatedButton, 'Calcular').evaluate().first.widget;
    boton.onPressed();
    await tester.pumpAndSettle();

    expect(find.text("Asistencia en presupuesto"), findsOneWidget);
  });

  testWidgets('Calcular sin rellenar campos', (WidgetTester tester) async {
    await tester.pumpWidget(AplicacionTecnicos());
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));
    ElevatedButton boton = find
        .widgetWithText(ElevatedButton, 'Calcular Presupuesto')
        .evaluate()
        .first
        .widget;
    boton.onPressed();
    await tester.pumpAndSettle();

    expect(find.text("SOSEMADO Technical View"), findsNothing);
    expect(find.text("Calculadora de presupuestos"), findsOneWidget);
    await tester.pump(Duration(seconds: 2));
    boton =
        find.widgetWithText(ElevatedButton, 'Calcular').evaluate().first.widget;
    boton.onPressed();
    await tester.pumpAndSettle();

    expect(find.text("Asistencia en presupuesto"), findsNothing);
  });
}
