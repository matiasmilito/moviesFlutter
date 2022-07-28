import 'package:movies_app/models/casting_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/actor_model.dart';
import '../models/casting_model.dart';


class CastProvider {
  final String _apiKey = '48e77bf7511d41e1e10bc90f0dfff540';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';

  Future<List<Miembro>> getCast(int movie_id) async {
    final url = Uri.https(_url, '3/movie/{$movie_id}/credits',
      {'movie_id': movie_id,'api_key': _apiKey, 'language': _language},
    );
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = Cast.fromJsonList(decodedData['cast']);
    return cast.items;
  }
}