import 'package:flutter/material.dart';

@override
Widget passwordField(context, TextEditingController _passwordController) {
  return TextField(
    autofocus: false,
    style: TextStyle(fontSize: 15.0, color: Colors.black),
    cursorColor: Colors.black,
    controller: _passwordController,
    obscureText: true,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
    ),
  );
}
