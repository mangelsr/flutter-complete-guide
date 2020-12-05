import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/models/cast_model.dart';
import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey = '';
  String _url = 'api.themoviedb.org';
  // String _language = 'en-US';
  String _language = 'es-ES';

  int _popularPage = 0;
  bool _loading = false;

  List<Movie> _popularMovies = List();

  final StreamController<List<Movie>> _streamPopular =
      StreamController.broadcast();

  void dispose() {
    _streamPopular?.close();
  }

  Function(List<Movie>) get popularSink => _streamPopular.sink.add;

  Stream<List<Movie>> get popularStream => _streamPopular.stream;

  Future<List<Movie>> _getResponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonArray(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    return await _getResponse(url);
  }

  Future<List<Movie>> getPopular() async {
    if (_loading) return [];
    _loading = true;
    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '$_popularPage'});
    final resp = await _getResponse(url);
    _popularMovies.addAll(resp);
    popularSink(_popularMovies);
    _loading = false;
    return resp;
  }

  Future<List<Actor>> getCast(int movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language});
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    return Cast.fromJsonList(decodeData['cast']).actors;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    return await _getResponse(url);
  }
}
