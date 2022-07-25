import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class tarjeta_pelicula extends StatelessWidget {
  const tarjeta_pelicula({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 5.0,
        color: Colors.teal.shade50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('RATING : ${pelicula.voteAverage.toString()}'),
              Container(
                height: 5.0,
                width: pelicula.voteAverage * 10,
                color: Colors.blue,
              ),
              const SizedBox(height: 8),
              Text('Titulo Original: ${pelicula.originalTitle}'),
              const SizedBox(height: 8),
              Text('Fecha de Lanzamiento: ${pelicula.releaseDate}'),
              const SizedBox(height: 8),
              Text(
                'Adultos:' + (pelicula.adult ? 'SI' : 'NO'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
