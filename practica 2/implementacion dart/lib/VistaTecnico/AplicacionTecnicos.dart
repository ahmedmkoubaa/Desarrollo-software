import 'package:ds_practica2/VistaTecnico/PantallaCarga.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Menu.dart';

void main(List<String> args) {
  runApp(AplicacionTecnicos());
}

class AplicacionTecnicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PantallaCarga(), title: "SOSEMADO Technical View");
  }
}
