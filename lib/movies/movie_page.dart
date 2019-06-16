import 'package:flutter/material.dart';
import 'package:flutter_movies_udemy/movies/movie.dart';
import 'package:flutter_movies_udemy/movies/movie_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  MoviePage(this.movie);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _bloc = MovieBloc();

  Movie get movie => widget.movie;

  @override
  void initState() {
    super.initState();

    _bloc.fetchFavorito(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        backgroundColor: Colors.deepOrange,
        expandedHeight: 350,
        pinned: false,
        actions: <Widget>[iconFavorito()],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text("${movie.title}"),
          background: Container(
            child: Hero(
              tag: movie.tag,
              child: Image.network(
                movie.urlFoto,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      SliverList(delegate: _sliver())
    ]);
  }

  /**
   * Icone de favoritos com o Flare.
   * O parâmetro animation recebe qual animação deve fazer.
   * Lá no flare podemos ver que esse arquivo possui as animações Favorite e Unfavorite
   * https://www.2dimensions.com/a/funwithflutter/files/flare/heart
   */
  iconFavorito() {
    return InkWell(
      onTap: () {
        _onClickFavoritar();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 36,
        height: 36,
        child: StreamBuilder(
          initialData: false,
          stream: _bloc.getFavoritos,
          builder: (context, snapshot) {
            return FlareActor(
              "assets/animations/favorite.flr",
              color: snapshot.data ? Colors.red : Colors.white,
              shouldClip: false,
              animation: snapshot.data ? "Favorite" : "Unfavorite",
            );
          },
        ),
      ),
    );
  }

  _sliver() {
    return SliverChildListDelegate(
      [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _card(Icons.favorite, movie.vote_count),
                  _card(Icons.star, movie.vote_average),
                ],
              ),
              Row(
                children: <Widget>[
                  _card(Icons.movie, movie.popularity),
                  _card(Icons.date_range, movie.release_date),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(26),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Colors.red, Colors.deepOrange],
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.description,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                movie.overview,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _card(IconData icone, dynamic texto) {
    return Container(
      child: Expanded(
        flex: 1,
        child: InkWell(
          onTap: () {
            print("Tap > $texto");
          },
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
            margin: EdgeInsets.all(15),
            decoration: new BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Icon(
                  icone,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "$texto",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _onClickFavoritar() async {
    _bloc.favoritar(movie);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.close();
  }
}
