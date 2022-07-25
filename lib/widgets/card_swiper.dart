import 'package:flutter/material.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../pages/pelicula_page.dart';
import '../models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  //final List<String> images;
  const CardSwiper({
    Key? key,
    required this.peliculas,
    //required this.images
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwiperPagination? paginacion;
    final SwiperControl? control;
    final Size _screen = MediaQuery.of(context).size;

//kIsWeb nos indica si estamos en un entorno web
    if (kIsWeb) {
//Si el entorno es web QUEREMOS QUE APARERSCAN la paginacion y las flechas
      paginacion = const SwiperPagination();
      control = const SwiperControl();
    } else {
//Si la plataforma no es web. aún debo chequear si no es plataforma de escritorio
      if (Platform.isAndroid || Platform.isIOS) {
        paginacion = null;
        control = null;
      } else {
        paginacion = const SwiperPagination();
        control = const SwiperControl();
      }
    }

    return Hero(
      tag: 'poster',
      child: Swiper(
        //Esto es lo que va a devolver, el widget para mostrar en pantalla
        //El método esta definido en el Widget Swiper
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PeliculaPage(
                        pelicula: peliculas[index],
                      ),
                    ),
                  );
                },
                child: FadeInImage(
                  image: peliculas[index].getPosterImg(),
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        indicatorLayout: PageIndicatorLayout.NONE,
        itemCount: peliculas.length,
        fade: 1.0,
        viewportFraction: 0.85,
        itemHeight: _screen.height * 0.7,
        itemWidth: _screen.width * 0.7,
        //Acá estan la paginación y el control que nosotros armamos con variables
        //arriba. Si no van son NUll y si van son on objeto de contol
        pagination: paginacion,
        control: control,
      ),
    );
  }
}
