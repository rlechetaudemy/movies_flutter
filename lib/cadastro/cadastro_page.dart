import 'package:flutter/material.dart';
import 'package:flutter_movies_udemy/cadastro/cadastro_bloc.dart';
import 'package:flutter_movies_udemy/home/home_page.dart';
import 'package:flutter_movies_udemy/utils/alerts.dart';
import 'package:flutter_movies_udemy/utils/nav.dart';
import 'package:flutter_movies_udemy/utils/validators.dart';
import 'package:flutter_movies_udemy/widgets/bg_login.dart';
import 'package:flutter_movies_udemy/widgets/button.dart';
import 'package:flutter_movies_udemy/widgets/button_cancel.dart';
import 'package:flutter_movies_udemy/widgets/textfield.dart';

import 'cadastro_api.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final _input = CadastroInput();

  final _bloc = CadastroBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BgLogin(),
          _body(),
        ],
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/logo_nf.png",
                  width: 120, height: 120),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Nome",
                "Digite o seu nome",
                validator: (text) {
                  return validateRequired(text, "Informe o nome");
                },
                onSaved: (value) => this._input.nome = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Email",
                "Digite o seu email",
                validator: (text) {
                  return validateRequired(text, "Informe o email");
                },
                onSaved: (value) => this._input.email = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Login",
                "Digite o seu login",
                validator: (text) {
                  return validateRequired(text, "Informe o login");
                },
                onSaved: (value) => this._input.login = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Senha",
                "Digite a sua senha",
                password: true,
                validator: (text) {
                  return validateRequired(text, "Informe a senha");
                },
                onSaved: (value) => this._input.senha = value,
              ),
            ),
            StreamBuilder<bool>(
              stream: _bloc.progress.stream,
              initialData: false,
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsets.only(top: 16),
                  child: AppButton(
                    "Cadastrar",
                    _onClickCadastrar,
                    showProgress: snapshot.data,
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppButtonCancel(
                "Cancelar",
                _onClickCancelar,
              ),
            )
          ],
        ),
      ),
    );
  }

  _onClickCadastrar() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    // Salva o form
    _formKey.currentState.save();

    final response = await _bloc.cadastrar(_input);
    if (response.isOk()) {
      pushReplacement(context, HomePage());
    } else {
      alert(context, "Filmes", response.msg);
    }
  }

  void _onClickCancelar() {
    pop(context);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
