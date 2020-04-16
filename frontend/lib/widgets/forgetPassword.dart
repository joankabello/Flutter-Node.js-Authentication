import 'package:flutter/material.dart';

@override
Widget forgetPassword(context) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      'Forget Password?',
      style: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.left,
    ),
  );
}
