import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_movies_udemy/movies/movie_api.dart';
import 'package:flutter_movies_udemy/utils/response.dart';
import 'package:rxdart/rxdart.dart';

import 'movie.dart';

class MoviesBloc extends BlocBase {
  // progress
  final _progressController = BehaviorSubject<bool>();

  get progressStream => _progressController.stream;

  // stream
  final _moviesController = BehaviorSubject<Response<List<Movie>>>();

  get moviesStream => _moviesController.stream;

  Future fetch({bool isRefresh = false}) async {
    _progressController.sink.add(true);

    try {
      if (isRefresh) {
        _moviesController.sink.add(null);
      }

      final movies = await MoviesApi.getMovies();

      _moviesController.sink.add(movies);

      return movies;
    } finally {
      _progressController.sink.add(false);
    }
  }

  @override
  void dispose() {
    print("dispose");

    _progressController.close();
    _moviesController.close();

    super.dispose();
  }
}
