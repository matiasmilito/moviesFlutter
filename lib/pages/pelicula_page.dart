import 'package:movies_app/models/pelicula_model.dart';
import 'package:flutter/material.dart';

class PeliculaPage extends StatelessWidget {
  final Pelicula pelicula;
  const PeliculaPage({Key? key, required this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      child:
      Text('${pelicula.originalTitle}'),
    );
  }
}
