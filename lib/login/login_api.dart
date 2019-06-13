import 'dart:convert' as convert;

import 'package:flutter_movies_udemy/utils/response.dart';
import 'package:http/http.dart' as http;

class LoginInput {
  String login;
  String senha;

  toMap() {
    return {
      "login": login,
      "senha": senha,
    };
  }
}

class LoginResponse {
  final bool status;
  final String msg;

  LoginResponse.fromJson(Map<String, dynamic> map)
      : status = map["status"] == "OK",
        msg = map["msg"];
}

class LoginApi {
  static Future<Response<LoginResponse>> login(LoginInput l) async {
    await Future.delayed(Duration(milliseconds: 200));

    final url = "http://livrowebservices.com.br/rest/login";

    final params = {"login": l.login, "senha": l.senha};

    print("> Login POST: $url");
    print("> Params: $params");

    final response = await http.post(url, body: params);

    final json = response.body;
    final map = convert.json.decode(json);
    print("< json: $map");

    final r = LoginResponse.fromJson(map);

    return Response(r.status, msg: r.msg);
  }
}
