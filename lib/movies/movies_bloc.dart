import 'package:flutter_movies_udemy/movies/movie_api.dart';
import 'package:flutter_movies_udemy/utils/simple_bloc.dart';

class MoviesBloc extends SimpleBloc {

  Future fetch({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        add(null);
      }

      final movies = await MoviesApi.getMovies();

      add(movies);

      return movies;
    } catch (error) {
      addError("Nenhum Filme !!!");
    }
  }
}
