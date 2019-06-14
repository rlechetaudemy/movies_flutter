import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_udemy/favoritos/favoritos_bloc.dart';
import 'package:flutter_movies_udemy/login/login_page.dart';
import 'package:flutter_movies_udemy/movies/movies_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => MoviesBloc()),
        Bloc((i) => FavoritosBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          textTheme: TextTheme(
              title: TextStyle(fontSize: 30, color: Colors.red),
              subtitle: TextStyle(fontSize: 20, color: Colors.red),
              body1: TextStyle(fontSize: 15, color: Colors.red)),
        ),
        home: LoginPage(),
      ),
    );
  }
}
