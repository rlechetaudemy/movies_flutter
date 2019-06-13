import 'package:flutter/material.dart';

class AppButtonCancel extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  AppButtonCancel(this.text, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.deepOrange,
          ),
        ),
        onPressed: callback,
      ),
    );
  }
}
