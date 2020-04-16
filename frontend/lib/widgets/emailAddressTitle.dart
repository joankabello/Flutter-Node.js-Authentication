import 'package:flutter/material.dart';

@override
Widget emailAddressTitle(context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      'Email address',
      style: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
