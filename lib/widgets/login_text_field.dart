import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final double margin;
  final String hint;
  final Icon prefixIcon;
  final bool obscureText;

  LoginTextField(
      {this.margin, this.hint, this.prefixIcon, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
        hintText: hint,
        prefixIcon: prefixIcon,
      ),
      obscureText: obscureText,
    );
  }
}
