import 'package:flutter/material.dart';

@override
Widget emailField(context, TextEditingController _usernameController) {
  return TextField(
    autofocus: false,
    style: TextStyle(fontSize: 15.0, color: Colors.black),
    cursorColor: Colors.black,
    controller: _usernameController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
    ),
  );
}
