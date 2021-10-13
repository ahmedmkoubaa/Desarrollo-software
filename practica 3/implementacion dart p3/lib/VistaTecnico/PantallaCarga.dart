import 'package:ds_practica2/VistaTecnico/Menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class PantallaCarga extends StatefulWidget {
  @override
  State<PantallaCarga> createState() {
    return new PantallaCargaState();
  }
}

class PantallaCargaState extends State<PantallaCarga> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Menu())));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 70, 100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction,
                size: 50, color: Color.fromARGB(255, 255, 255, 255)),
            Text("SOSEMADO",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 255, 255, 255))),
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.yellow : Colors.white,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
