import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_udemy/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        /**
         * Movi os blocs para a HomePage.
         * Para mostrar que não necessariamente eles precisam estar no arquivo main.
         * Para maiores detalhes, assistir a aula.
         */
//        Bloc((i) => MoviesBloc()),
//        Bloc((i) => FavoritosBloc()),
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
