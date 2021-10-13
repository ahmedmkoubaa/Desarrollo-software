//import 'dart:html';

import 'package:ds_practica2/ModeloSOSEMADO/Presupuesto.dart';
import 'package:ds_practica2/ModeloSOSEMADO/Tecnico.dart';
import 'package:ds_practica2/ModeloSOSEMADO/ValoracionPresupuesto.dart';
import 'package:ds_practica2/VistaTecnico/PantallaCarga.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() {
    return new CalculadoraState();
  }
}

class CalculadoraState extends State<Calculadora> {
  final controladorDuracion = TextEditingController();
  final controladorMateriales = TextEditingController();
  final controladorDesplazamiento = TextEditingController();
  final controladorPersonal = TextEditingController();
  final controladorComplejidad = TextEditingController();

  double duracion;
  double costeMaterial;
  int complejidad;
  double costeDesplazamiento;
  double costePersonalExtra;

  ValoracionPresupuesto _valoracion;

  void setValues() {
    duracion = double.parse(controladorDuracion.text);
    costeMaterial = double.parse(controladorMateriales.text);
    complejidad = int.parse(controladorComplejidad.text);
    costeDesplazamiento = double.parse(controladorDesplazamiento.text);
    costePersonalExtra = double.parse(controladorPersonal.text);
  }

  void mostrarPresupuestoIdeal() {
    Presupuesto presupuesto = _valoracion.getPresupuestoIdeal();
    controladorDuracion.text = presupuesto.duracion.toString();
    controladorPersonal.text = presupuesto.costePersonalExtra.toString();
    controladorDesplazamiento.text = presupuesto.costeDesplazamiento.toString();
    controladorComplejidad.text = presupuesto.complejidad.toString();
    controladorMateriales.text = presupuesto.costeMaterial.toString();
  }

  Presupuesto getPresupuestoFromForm() {
    setValues();
    Presupuesto leido = Presupuesto();

    leido.costeMaterial = costeMaterial;
    leido.complejidad = complejidad;
    leido.duracion = duracion;
    leido.costeDesplazamiento = costeDesplazamiento;
    leido.costePersonalExtra = costePersonalExtra;

    return leido;
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: const Text('Asistencia en presupuesto'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_valoracion.getDescripcion()),
          ],
        ),
        actions: <Widget>[
          new MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Theme.of(context).primaryColor,
            child: const Text('Seguir editando'),
          ),
          new MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            color: Theme.of(context).primaryColor,
            child: const Text('Guardar y salir'),
          ),
          new MaterialButton(
            onPressed: () {
              mostrarPresupuestoIdeal();
              Navigator.of(context).pop();
            },
            color: Theme.of(context).primaryColor,
            child: const Text('Cargar presupuesto ideal'),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Calculadora de presupuestos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Descripçao do travalho manito"),
            TextFormField(
              controller: controladorDuracion,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Duración',
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              ),
            ),
            TextFormField(
              controller: controladorMateriales,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Coste de los materiales',
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              ),
            ),
            TextFormField(
              controller: controladorDesplazamiento,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Coste de Desplazamiento',
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              ),
            ),
            TextFormField(
              controller: controladorPersonal,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Coste de Personal Extra',
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              ),
            ),
            TextFormField(
              controller: controladorComplejidad,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Complejidad',
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              ),
            ),
            ElevatedButton(
              child: Text("Calcular"),
              onPressed: () {
                Presupuesto presupuesto =
                    getPresupuestoFromForm(); // Obtener datos leidos en el formulario y generar un presupuesto
                Tecnico tecnico = Tecnico(
                    "Técnico de pruebas"); // Este técnico se crea como parte de la simulación de la calculadora

                _valoracion = tecnico.asistentePresupuesto(
                    presupuesto); // Generar valoración del presupuesto en cuestión

                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
