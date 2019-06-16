import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_udemy/favoritos/favoritos_bloc.dart';
import 'package:flutter_movies_udemy/movies/movie.dart';
import 'package:flutter_movies_udemy/movies/movie_page.dart';
import 'package:flutter_movies_udemy/utils/nav.dart';
import 'package:flutter_movies_udemy/widgets/text_empty.dart';
import 'package:flutter_movies_udemy/widgets/text_error.dart';

class TabFavoritos extends StatefulWidget {
  @override
  _TabFavoritosState createState() => _TabFavoritosState();
}

class _TabFavoritosState extends State<TabFavoritos>
    with AutomaticKeepAliveClientMixin<TabFavoritos> {

  @override
  bool get wantKeepAlive => true;

  FavoritosBloc get bloc => BlocProvider.getBloc<FavoritosBloc>();

  @override
  void initState() {
    super.initState();

    bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Erro
          return Center(
            child: TextError(
              snapshot.error,
              onRefresh: _onRefreshError,
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Movie> movies = snapshot.data;
        print("Movies $movies");

        return movies.isEmpty
            ? TextEmpty("Nenhum filme nos favoritos.")
            : _griView(movies, context);
      },
    );
  }

  _griView(List<Movie> movies, context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: GridView.builder(
        gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
    m.tag = m.title + "-fav";

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
}
