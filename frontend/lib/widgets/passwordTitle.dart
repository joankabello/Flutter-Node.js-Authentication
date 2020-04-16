import 'package:flutter/material.dart';

@override
Widget passwordTitle(context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      'Password',
      style: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.left,
    ),
  );
}
