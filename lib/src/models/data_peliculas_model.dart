class Peliculas1 {
  List<DataPelicula> items = [];

  Peliculas1();

  Peliculas1.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;
    try {
      for (var item in jsonList) {
        final pelicula = DataPelicula.fromJson(item);
        print(pelicula);
        items.add(pelicula);
      }
    } catch (e) {
      print(e);
    }
  }
}

class DataPelicula {
  DataPelicula({
    required this.Title,
    required this.Year,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.Ratings,
    required this.Metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    required this.DVD,
    required this.BoxOffice,
    required this.Production,
    required this.Website,
    required this.Response,
  });
  late final String Title;
  late final String Year;
  late final String Rated;
  late final String Released;
  late final String Runtime;
  late final String Genre;
  late final String Director;
  late final String Writer;
  late final String Actors;
  late final String Plot;
  late final String Language;
  late final String Country;
  late final String Awards;
  late final String Poster;
  late final List<RatingsClass> Ratings;
  late final String Metascore;
  late final String imdbRating;
  late final String imdbVotes;
  late final String imdbID;
  late final String Type;
  late final String DVD;
  late final String BoxOffice;
  late final String Production;
  late final String Website;
  late final String Response;

  DataPelicula.fromJson(Map<String, dynamic> json) {
    Title = json['Title'];
    Year = json['Year'];
    Rated = json['Rated'];
    Released = json['Released'];
    Runtime = json['Runtime'];
    Genre = json['Genre'];
    Director = json['Director'];
    Writer = json['Writer'];
    Actors = json['Actors'];
    Plot = json['Plot'];
    Language = json['Language'];
    Country = json['Country'];
    Awards = json['Awards'];
    Poster = json['Poster'];
    Ratings = List.from(json['Ratings'])
        .map((e) => RatingsClass.fromJson(e))
        .toList();
    Metascore = json['Metascore'];
    imdbRating = json['imdbRating'];
    imdbVotes = json['imdbVotes'];
    imdbID = json['imdbID'];
    Type = json['Type'];
    DVD = json['DVD'];
    BoxOffice = json['BoxOffice'];
    Production = json['Production'];
    Website = json['Website'];
    Response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Title'] = Title;
    data['Year'] = Year;
    data['Rated'] = Rated;
    data['Released'] = Released;
    data['Runtime'] = Runtime;
    data['Genre'] = Genre;
    data['Director'] = Director;
    data['Writer'] = Writer;
    data['Actors'] = Actors;
    data['Plot'] = Plot;
    data['Language'] = Language;
    data['Country'] = Country;
    data['Awards'] = Awards;
    data['Poster'] = Poster;
    data['Ratings'] = Ratings.map((e) => e.toJson()).toList();
    data['Metascore'] = Metascore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = Type;
    data['DVD'] = DVD;
    data['BoxOffice'] = BoxOffice;
    data['Production'] = Production;
    data['Website'] = Website;
    data['Response'] = Response;
    return data;
  }
}

class RatingsClass {
  RatingsClass({
    required this.Source,
    required this.Value,
  });
  late final String Source;
  late final String Value;

  RatingsClass.fromJson(Map<String, dynamic> json) {
    Source = json['Source'];
    Value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Source'] = Source;
    data['Value'] = Value;
    return data;
  }
}
/*
class DataPelicula {
  DataPelicula({
    required this.type,
    required this.id,
    required this.image,
    required this.title,
    required this.titleType,
    required this.year,
  });
  late final String type;
  late final String id;
  late final Image image;
  late final String title;
  late final String titleType;
  late final int year;

  DataPelicula.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['id'];
    image = Image.fromJson(json['image']);
    title = json['title'];
    titleType = json['titleType'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@type'] = type;
    data['id'] = id;
    data['image'] = image.toJson();
    data['title'] = title;
    data['titleType'] = titleType;
    data['year'] = year;
    return data;
  }
}

class Image {
  Image({
    required this.height,
    required this.id,
    required this.url,
    required this.width,
  });
  late final int height;
  late final String id;
  late final String url;
  late final int width;

  Image.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['height'] = height;
    data['id'] = id;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}
*/