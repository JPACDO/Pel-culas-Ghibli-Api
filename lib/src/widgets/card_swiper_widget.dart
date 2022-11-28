import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peli_ghibli.dart';
// import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<PeliculaGhibli> peliculas;

  const CardSwiper({super.key, required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      // width: _screenSize.width * 0.7,
      // height: _screenSize.height * 0.5,
      padding: const EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          peliculas[index].uniqueId = '${peliculas[index].id}-targeta';

          return Hero(
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  child: FadeInImage(
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    placeholder: const AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.fill,
                  ),
                  onTap: (() => Navigator.pushNamed(context, 'detalle',
                      arguments: peliculas[index])),
                )
                // Image.network(  "https://via.placeholder.com/350x150",it: BoxFit.cover, ),
                ),
          );
        },
        itemCount: peliculas.length,
        // pagination: const SwiperPagination(),
        // control: const SwiperControl(),
      ),
    );
  }
}
