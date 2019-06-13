
import 'package:flutter/material.dart';

class TextEmpty extends StatelessWidget {
  final String msg;

  TextEmpty(this.msg);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(msg,
          style: TextStyle(
            color: Colors.red,
            fontSize: 24
          ),
        )
      ],
    );
  }
}
