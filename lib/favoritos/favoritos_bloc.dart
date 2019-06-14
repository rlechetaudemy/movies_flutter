import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_movies_udemy/movies/movie.dart';
import 'package:flutter_movies_udemy/movies/movie_db.dart';
import 'package:rxdart/rxdart.dart';

class FavoritosBloc extends BlocBase {
  // stream
  final _movies = BehaviorSubject<List<Movie>>();

  get moviesStream => _movies.stream;

  Future fetch({bool isRefresh = false}) async {

    try {
      if (isRefresh) {
        _movies.sink.add(null);
      }

      final db = MovieDB.getInstance();
      final movies = await db.getMovies();

      _movies.sink.add(movies);

      return movies;
    } catch(error) {
      moviesStream.addError("Nenhum Filme !!!");
    }
  }

  close() {
    _movies.close();
  }
}
