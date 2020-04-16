import 'package:flutter/material.dart';

@override
Widget welcomeLogo(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Image.asset(
      'assets/ottoWildeLogo.png',
      scale: 7,
      alignment: Alignment.topCenter,
    ),
  );
}
