import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Actor {
  String? birthday;
  late String knownForDepartment;
  String? deathday;
  late int id;
  late String name;
  late List<String> alsoKnownAs;
  late int gender;
  late String biography;
  late double popularity;
  String? placeOfBirth;
  String? profilePath;
  late bool adult;
  late String imdbId;
  late String homepage;

  Actor(
      {this.birthday,
        required this.knownForDepartment,
        this.deathday,
        required this.id,
        required this.name,
        required this.alsoKnownAs,
        required this.gender,
        required this.biography,
        required this.popularity,
        this.placeOfBirth,
        this.profilePath,
        required this.adult,
        required this.imdbId,
        required this.homepage});

  Actor.fromJsonMap(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    deathday = json['deathday'];
    id = json['id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as'].cast<String>();
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    imdbId = json['imdb_ib'];
    homepage = json['homepage'];
  } //Actor

  ImageProvider getActorImg() {
    if (profilePath == null) {
      return const AssetImage('assets/images/no-image.jpg');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w50/$profilePath');
    }
  }

}

class Actores {
  List<Actor> items = [];

  Actores.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final Actor act = Actor.fromJsonMap(item);
      items.add(act);
    }
  }
}