import 'package:flutter_movies_udemy/utils/progress_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'cadastro_api.dart';

class CadastroBloc {
  final progress = ProgressBloc();

  cadastrar(CadastroInput input) async {
    progress.setProgress(true);

    try {
      return await CadastroApi.cadastrar(input);
    } finally {
      progress.setProgress(false);
    }
  }

  close() {
    progress.close();
  }
}
