import 'package:flutter_movies_udemy/cadastro/cadastro_api.dart';
import 'package:flutter_movies_udemy/utils/simple_bloc.dart';

class CadastroBloc extends SimpleBloc {

  cadastrar(CadastroInput input) async {
    progress.setProgress(true);

    try {
      return await CadastroApi.cadastrar(input);
    } finally {
      progress.setProgress(false);
    }
  }
}
