import 'package:flutter_movies_udemy/utils/response.dart';

class CadastroInput {
  String nome;
  String login;
  String email;
  String senha;

  toMap() {
    return {
      "nome": nome,
      "login": login,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return "${toMap()}";
  }
}

class CadastroApi {
  static Future<Response> cadastrar(CadastroInput c) async {
    print("> post cadastro $c");

    await Future.delayed(Duration(seconds: 2));

    return Response(true);
  }
}
