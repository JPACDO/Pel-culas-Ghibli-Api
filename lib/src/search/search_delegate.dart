import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peli_ghibli.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';

  final peliculasProvider = PeliculasProvider();
  final peliculas = [
    'ddd',
    'fff',
    'ffffff',
    'eeee',
    'tttt',
  ];

  final peliculasRecientes = [
    'ddd',
    'fff',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // las acciones de nuestro AppBar
    return [
      IconButton(
          onPressed: (() {
            // print('CLICKKKK');
            query = '';
          }),
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
        onPressed: (() {
          // print('Leading icon');
          close(context, null);
        }),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // CRea los resultados que vasmos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la presona escribe

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<PeliculaGhibli>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;

          return ListView(
            children: peliculas!.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: const AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (() {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                }),
              );
            }).toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


}
