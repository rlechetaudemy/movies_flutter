import 'package:flutter_movies_udemy/login/login_api.dart';
import 'package:flutter_movies_udemy/utils/simple_bloc.dart';

class LoginBloc extends SimpleBloc {

  login(LoginInput input) async {
    progress.setProgress(true);

    try {
      return await LoginApi.login(input);
    } finally {
      progress.setProgress(false);
    }
  }
}
