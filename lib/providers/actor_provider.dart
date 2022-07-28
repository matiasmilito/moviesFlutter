import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/actor_model.dart';
import '../models/casting_model.dart';

class ActorProvider {
  final String _apiKey = '48e77bf7511d41e1e10bc90f0dfff540';
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _person_id = Miembro.getActorId();

  Future<List<Actor>> getActor() async {
    final url = Uri.https(_url, '3/movie/person', {
      'person_id': _person_id,
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final actores = Actores.fromJsonList(decodedData['results']);
    return actores.items;
  }
}