import 'package:movies_app/widgets/tarjeta_pelicula.dart';
import 'package:flutter/material.dart';

class Miembro{
  late bool adult;
  int? gender;
  late int id;
  late String known_for_department;
  late String name;
  late String original_name;
  late double popularity;
  String? profile_path;
  late int cast_id;
  late String character;
  late String credit_id;
  late int order;

  Miembro(
      {required this.adult,
        this.gender,
        required this.id,
        required this.known_for_department,
        required this.name,
        required this.original_name,
        required this.popularity,
        this.profile_path,
        required this.cast_id,
        required this.character,
        required this.credit_id,
        required this.order});

  Miembro.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult '];
    gender = json['gender'];
    id = json['id'];
    known_for_department = json['known_for_department'];
    name = json['name'];
    original_name = json['original_name'];
    popularity = json['popularity'] / 1;
    profile_path = json['profile_path'];
    cast_id = json['cast_id'];
    character = json['character'];
    credit_id = json['credit_id'];
    order = json['order'];
  }

  ImageProvider getMiembroImg() {
    if (profile_path == null) {
      return const AssetImage('assets/images/no-image.jpg');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w50/$profile_path');
    }
  }

  getActorId() {
    return id;
  }
}

class Cast {
  List<Miembro> items = [];


  Cast.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final Miembro miembro = Miembro.fromJsonMap(item);
      items.add(miembro);

    }
  }
}