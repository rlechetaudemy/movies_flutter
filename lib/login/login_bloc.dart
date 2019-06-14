import 'package:flutter_movies_udemy/login/login_api.dart';
import 'package:flutter_movies_udemy/utils/progress_bloc.dart';

class LoginBloc {
  final progress = ProgressBloc();

  login(LoginInput input) async {
    progress.setProgress(true);

    try {
      return await LoginApi.login(input);
    } finally {
      progress.setProgress(false);
    }
  }

  close() {
    print("close!!!");
    progress.close();
  }
}
