import 'dart:convert' as convert;

import 'package:flutter_movies_udemy/movies/api_key.dart';
import 'package:flutter_movies_udemy/movies/movie.dart';
import 'package:http/http.dart' as http;

class MoviesApi {
  static bool FAKE = false;

  static Future<List<Movie>> getMovies() async {
    try {
      // await Future.delayed(Duration(seconds: 1));

      final url =
          "https://api.themoviedb.org/3/movie/popular?api_key=$api_key&language=pt-BR";
      print("> get: $url");

      final response = await http.get(url);
      String json = response.body;

      // Parser
      final map = convert.json.decode(json);
//      print("< json: $map");

      final mapMovies = map["results"];

      List<Movie> movies =
          mapMovies.map<Movie>((json) => Movie.fromJson(json)).toList();

      return movies;
    } catch (error) {
      print("MovieApi error $error");

      throw error;
    }
  }
}
