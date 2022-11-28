import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peli_ghibli.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';

//import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Peliulas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            onPressed: (() {
              showSearch(
                context: context,
                delegate: DataSearch(),
                // query: 'Hola',
              );
            }),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      //body: SafeArea(child: Text('hola')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      //initialData: InitialData,
      builder:
          (BuildContext context, AsyncSnapshot<List<PeliculaGhibli>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data!);
        } else {
          return Container(
              height: 400,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
    // peliculasProvider.getEnCines();
    // return CardSwiper(peliculas: [1, 2, 3, 4, 5]);
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Populares',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: ((BuildContext context,
                AsyncSnapshot<List<PeliculaGhibli>> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data!,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ],
      ),
    );
  }
}
