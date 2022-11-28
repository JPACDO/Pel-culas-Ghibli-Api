import 'dart:async';
import 'dart:convert';

// import 'package:peliculas/src/models/data_peliculas_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/peli_ghibli.dart';
// import 'package:peliculas/src/models/titulos_peliculas_model.dart';

class PeliculasProvider {
 
  final String _url = 'ghibliapi.herokuapp.com'; 
  final String _apiPath = 'films'; 
 
  int _popularesPage = 0;
  bool _cargando = false;

  List<PeliculaGhibli> _populares = [];

  final _popularesStreamController =
      StreamController<List<PeliculaGhibli>>.broadcast();

  Function(List<PeliculaGhibli>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<PeliculaGhibli>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Future<List<PeliculaGhibli>> _procesarRespuesta(Uri url) async {
    var resp = await http.get(url);
    final decodeData = jsonDecode(resp.body);

    final peliculas = Peliculas3.fromJsonList(decodeData);

    return peliculas.items;
  }

  Future<List<PeliculaGhibli>> getEnCines() async {
    // List<Map> totalPeliculas = [];
    // print('totalPeliculas');

    // for (int i = 0; i < 3; i++) {
    //   print(i);
    // var url = Uri.https(_url, _apiPath, {"i": listaPeliculas[i]}); //tconst

    // var resp = await http.get(
    //       url); //,headers: {'X-RapidAPI-Key': _apiKey, 'X-RapidAPI-Host': _apiHost});
    //   final decodeData = jsonDecode(resp.body);

    //   totalPeliculas.add(decodeData);
    // }

    // print(totalPeliculas);

    // final peliculas = Peliculas1.fromJsonList(totalPeliculas);

    // print(peliculas.items[0].title);

    var url = Uri.https(_url, _apiPath); //tconst


    return await _procesarRespuesta(url);

    // var resp = await http.get(url);
    // final decodeData = jsonDecode(resp.body);

    // final peliculas = Peliculas3.fromJsonList(decodeData);
    // // print(peliculas.items[1].title);
    // return peliculas.items;
  }

  Future<List<PeliculaGhibli>> getPopulares() async {
    if (_cargando) return [];

    _cargando = true;

    _popularesPage++;

    print('Cargando siguientes');
    var url = Uri.https(_url, _apiPath); //,{'page' : _popularesPage.toString()}

    final resp = await _procesarRespuesta(url);
    _populares.addAll(resp);

    popularesSink(_populares);

    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCast(String peliId) async {
    print('entra busqueda');
    final url = Uri.https(_url, '$_apiPath/$peliId');
    // print(url);
    final resp = await http.get(url);
    final decodeData = jsonDecode(resp.body);
    // print(decodeData['people']);

    List castJson = [];

    for (var i in decodeData['people']) {
      // print(i);
      final characterUrl = Uri.parse(i);
      final respCharact = await http.get(characterUrl);
      final decodeCharacter = jsonDecode(respCharact.body);

      castJson.add(decodeCharacter);
    }
    // print(castJson);

    print(castJson[0].runtimeType);

    if (castJson[0] is Map<String, dynamic>) {
      final cast = Cast.fromJsonList(castJson);
      return cast.actores;
    } else {
      return [];
    }

    // if (cast is Map<String, dynamic>) {
    //   print('Es Map<String, dynamic>');
    // }
    // if (cast is List<dynamic>) {
    //   print('Es List<dynamic>');
    // }

    // return cast.actores;
  }

  Future<List<PeliculaGhibli>> buscarPelicula(String query) async {
    var url = Uri.https(_url, _apiPath); //tconst
    final resp = await _procesarRespuesta(url);

    List<PeliculaGhibli> filtrada = [];

    for (var i in resp) {
      (i.title.toLowerCase().contains(query.toLowerCase()))
          ? filtrada.add(i)
          : null;
    }

    return filtrada;
  }
}
