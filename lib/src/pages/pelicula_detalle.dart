import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/peli_ghibli.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final pelicula =
        ModalRoute.of(context)!.settings.arguments as PeliculaGhibli;
    // print(pelicula.toJson());
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10.0,
                ),
                _posterTitulo(context, pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _crearCasting(pelicula),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAppbar(PeliculaGhibli pelicula) {
    print('crearappbar');
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: const AssetImage('assets/img/loading.gif'),
          //fadeInDuration: const Duration(seconds: 10),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, PeliculaGhibli pelicula) {
    print('posertitulo');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              Text(pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: <Widget>[
                  const Icon(Icons.star_border),
                  Text(
                    pelicula.rtScore, //ya esta en string
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _descripcion(PeliculaGhibli pelicula) {
    print('description');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Text(
        pelicula.description,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(PeliculaGhibli pelicula) {
    print('crarcasting');
    final peliProvider = PeliculasProvider();
    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearActoresPageView(List<Actor> actores) {
    print('crear actores page');
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: actores.length,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        itemBuilder: (context, index) => _actorTarjeta(actores[index]),
      ),
    );
  }

  Widget _actorTarjeta(Actor actor) {
    print('actor tarjeta');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            placeholder: const AssetImage('assets/img/no-image.jpg'),
            image: NetworkImage(actor.getFoto()),
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          actor.name,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }
}
