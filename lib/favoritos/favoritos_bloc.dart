import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_movies_udemy/movies/movie.dart';
import 'package:flutter_movies_udemy/movies/movie_db.dart';
import 'package:flutter_movies_udemy/utils/response.dart';
import 'package:rxdart/rxdart.dart';

class FavoritosBloc extends BlocBase {
  // progress
  final _progress = BehaviorSubject<bool>();

  get progressStream => _progress.stream;

  // stream
  final _movies = BehaviorSubject<Response<List<Movie>>>();

  get moviesStream => _movies.stream;

  Future fetch({bool isRefresh = false}) async {
    _progress.sink.add(true);

    try {
      if (isRefresh) {
        _movies.sink.add(null);
      }

      final db = MovieDB.getInstance();
      final list = await db.getMovies();
      final movies = Response(true, result: list);
      print("< sql ${movies.result.length}");

      _movies.sink.add(movies);

      return movies;
    } finally {
      _progress.sink.add(false);
    }
  }

  close() {
    _progress.close();
    _movies.close();
  }
}
