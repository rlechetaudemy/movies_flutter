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
        /**
         * Os blocs estão na HomePage para mostrar que não necessariamente os blocs precisam ser declarados no arquivo main.
         * Você pode declarar os blocs em qualquer lugar da sua hierarchia de Widgets,
         * e recuperá-los nos Widgets filhos.
         */
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: LoginPage(),
      ),
    );
  }
}
