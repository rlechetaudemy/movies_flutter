import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_udemy/movies/movie.dart';
import 'package:flutter_movies_udemy/movies/movies_bloc.dart';
import 'package:flutter_movies_udemy/utils/nav.dart';
import 'package:flutter_movies_udemy/utils/response.dart';
import 'package:flutter_movies_udemy/widgets/text_empty.dart';
import 'package:flutter_movies_udemy/widgets/text_error.dart';

import 'movie_page.dart';

class TabMovies extends StatefulWidget {
  @override
  _TabMoviesState createState() => _TabMoviesState();
}

class _TabMoviesState extends State<TabMovies>
    with AutomaticKeepAliveClientMixin<TabMovies> {

  MoviesBloc get bloc => BlocProvider.getBloc<MoviesBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.moviesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        Response<List<Movie>> response = snapshot.data;

        if (response.isOk() && response.result.isEmpty) {
          // Lista vazia
          return TextEmpty("Nenhum filme nos favoritos.");
        }

        return response.isOk()
            ? _griView(response.result, context, true)
            : Center(
                child: TextError(
                  response.msg,
                  onRefresh: _onRefreshError,
                ),
              );
      },
    );
  }

  _griView(List<Movie> movies, context, gridOn) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: gridOn
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _item(movies, index, context);
              },
            )
          : ListView.builder(
              itemExtent: 600,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _item(movies, index, context);
              },
            ),
    );
  }

  _item(List<Movie> movies, index, context) {
    Movie m = movies[index];

    // Tag para a animação do Hero
    m.tag = m.title;

    return Material(
      child: InkWell(
        child: Hero(
          tag: m.tag,
          child: Image.network(
            m.urlFoto,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          _onClickMovie(m);
        },
      ),
    );
  }

  void _onClickMovie(Movie m) {
    push(context, MoviePage(m));
  }

  Future<void> _onRefresh() {
    return bloc.fetch();
  }

  Future<void> _onRefreshError() {
    return bloc.fetch(isRefresh: true);
  }

  @override
  void dispose() {
    super.dispose();

    //_bloc.close();
  }
}
