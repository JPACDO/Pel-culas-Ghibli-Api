class Peliculas3 {
  List<PeliculaGhibli> items = [];

  Peliculas3();

  Peliculas3.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;

    for (var item in jsonList) {
      final pelicula = PeliculaGhibli.fromJson(item);
      items.add(pelicula);
    }
  }
}

class PeliculaGhibli {
  PeliculaGhibli({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });

  late String uniqueId;

  late final String id;
  late final String title;
  late final String originalTitle;
  late final String originalTitleRomanised;
  late final String image;
  late final String movieBanner;
  late final String description;
  late final String director;
  late final String producer;
  late final String releaseDate;
  late final String runningTime;
  late final String rtScore;
  late final List<String> people;
  late final List<String> species;
  late final List<String> locations;
  late final List<String> vehicles;
  late final String url;

  PeliculaGhibli.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    originalTitleRomanised = json['original_title_romanised'];
    image = json['image'];
    movieBanner = json['movie_banner'];
    description = json['description'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    runningTime = json['running_time'];
    rtScore = json['rt_score'];
    people = List.castFrom<dynamic, String>(json['people']);
    species = List.castFrom<dynamic, String>(json['species']);
    locations = List.castFrom<dynamic, String>(json['locations']);
    vehicles = List.castFrom<dynamic, String>(json['vehicles']);
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['original_title'] = originalTitle;
    data['original_title_romanised'] = originalTitleRomanised;
    data['image'] = image;
    data['movie_banner'] = movieBanner;
    data['description'] = description;
    data['director'] = director;
    data['producer'] = producer;
    data['release_date'] = releaseDate;
    data['running_time'] = runningTime;
    data['rt_score'] = rtScore;
    data['people'] = people;
    data['species'] = species;
    data['locations'] = locations;
    data['vehicles'] = vehicles;
    data['url'] = url;
    return data;
  }

  getPosterImg() {
    if (image == '') {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return image;
    }
  }

  getBackgroundImg() {
    if (image == '') {
      return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
    } else {
      return movieBanner;
    }
  }
}
