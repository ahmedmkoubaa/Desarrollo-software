import 'package:ds_practica2/VistaTecnico/Calculadora.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// void main() => runApp(Menu());

void main() {
  runApp(MaterialApp(
    title: 'Sosemado Technical View',
    home: Menu(),
  ));
}

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() {
    return new MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SOSEMADO Technical View")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Ver datos trabajo"),
            ),
            ElevatedButton(
              child: Text("Ver datos tecnico"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Calculadora())),
              child: Text("Calcular Presupuesto"),
            ),
          ],
        ),
      ),
    );
  }
}
