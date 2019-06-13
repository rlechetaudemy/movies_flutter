import 'package:rxdart/rxdart.dart';

import 'cadastro_api.dart';

class CadastroBloc {
  final _progressController = BehaviorSubject<bool>();

  get progressStream => _progressController.stream;

  cadastrar(CadastroInput input) async {
    _progressController.sink.add(true);

    try {
      return await CadastroApi.cadastrar(input);
    } finally {
      _progressController.sink.add(false);
    }
  }

  close() {
    _progressController.close();
  }
}
