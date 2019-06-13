
import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  final String msg;
  final Function onRefresh;

  TextError(this.msg, {this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRefresh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(msg,
            style: TextStyle(
              color: Colors.red,
              fontSize: 24
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text("Clique para tentar novamente.",
            style: TextStyle(
                color: Colors.red,
                fontSize: 24
            ),
          ),
        ],
      ),
    );
  }
}
