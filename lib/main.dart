import 'package:flutter/material.dart';

import 'pages/home_page.dart';

// Ingreso al programa por main.
//Lo unico que hace es correr una instancia de MyApp
void main() => runApp(const MyApp());

//MyAPP es un statelessWIdget, defino la clase
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override //Hago un Override del método Build
  //el método build va a construir y devolver un widget
  //Como es el primer Widget debe ser un MaterialApp
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie APP',
      home: HomePage(),
    );
  }
}
