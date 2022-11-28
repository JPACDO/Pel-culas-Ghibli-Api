class Cast {
  List<Actor> actores = [];
  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isEmpty) return;
    for (var item in jsonList) {
      final actor = Actor.fromJson(item);
      actores.add(actor);
    }
  }
}

class Actor {
  Actor({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.eyeColor,
    required this.hairColor,
    required this.films,
    required this.species,
    required this.url,
  });
  late final String id;
  late final String name;
  late final String gender;
  late final String age;
  late final String eyeColor;
  late final String hairColor;
  late final List<String> films;
  late final String species;
  late final String url;

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    eyeColor = json['eye_color'];
    hairColor = json['hair_color'];
    films = List.castFrom<dynamic, String>(json['films']);
    species = json['species'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['age'] = age;
    data['eye_color'] = eyeColor;
    data['hair_color'] = hairColor;
    data['films'] = films;
    data['species'] = species;
    data['url'] = url;
    return data;
  }

  getFoto() {
    //if (image == '') {
    return 'https://cdn2.iconfinder.com/data/icons/gaming-and-beyond-part-2-1/80/User_gray-512.png';
    //} else {
    // return image;
    //}
  }
}
