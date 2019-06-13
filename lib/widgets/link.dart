import 'package:flutter/material.dart';

class AppLink extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  AppLink(this.text, this.onPressed,{this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(text,
              style: TextStyle(
                color: this.color,
                decoration: TextDecoration.underline,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
