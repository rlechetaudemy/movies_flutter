import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final Function validator;
  final Function onSave;
  final bool password;

  AppText(this.label, this.hint,
      {this.validator, this.onSave, this.password = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      onSaved: this.onSave,
      obscureText: password,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.deepOrange,
        fontSize: 18,
      ),
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          hintText: this.hint,
//          hintStyle: TextStyle(
//            color: Colors.deepOrange,
//            fontSize: 18,
//          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          errorStyle: TextStyle(fontSize: 18)),
    );
  }
}
