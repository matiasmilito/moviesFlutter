//hago los import
import 'package:flutter/material.dart';
//El switch show indica que solo este disponible eluna parte de la libreria.
//en este caso, del paquete io, solamente estara visible Platform y del paquete
//foundation solo kIsWeb


import '../models/pelicula_model.dart';
import '../providers/peliculas_provider.dart';
import '../widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  late final peliculasProvider = PeliculasProvider();
  late final List<String> images;
  HomePage({Key? key}) : super(key: key);

//Método build, se ejecuta cada vez que se genera el widget
  @override
  Widget build(BuildContext context) {
//Mediaquery brinda información sobre el dispositivo fisico
//como el tamaño de la pantalla (el que usamos aca), pero tambien cosas
//como orientación, brillo de la pantalla, propiedades de las Fonts y mas.
    final Size _screen = MediaQuery.of(context).size;

//Observen el return. El método build devuelve siempre un widget
//Que se encajara en el arbol de elementos.
//En este caso el Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de peliculas'),
        //Un Appbar tiene una barra de acciones. Son a grandes rasgos botones
        //Los Actions esperan un widget para la parte grafica y un método onPress
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
//En el cuerpo del Scaffold, va una columna para poner arriba el slide de peliculas
//en cartelera y abajo las peliculas por rating
      body: Column(
        children: [
//Envuelvo el Swiper dentro de un container para darle contencion y especificar tamaños
//Los tamaños los tomo de _screen, la variable que inicialicé a traves del MediaQuery
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.7,
//Finalmente el Swiper
            child: _swiperTarjetas(context),
          ),
        ],
      ),
    );
  }

  Widget _swiperTarjetas(BuildContext context) {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data!);
        } else {
          return const SizedBox(
              height: 500.0,
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
