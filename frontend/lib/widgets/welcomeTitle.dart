import 'package:flutter/material.dart';
import '../model/models.dart';

@override
Widget welcomeTitle(context) {
  return Align(
    heightFactor: SizeConfig.safeBlockVertical / 2,
    alignment: Alignment.bottomCenter,
    child: Align(
      alignment: Alignment.center,
      child: Text(
        'EIN GRILL\nZWEI SYSTEME',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: SizeConfig.safeBlockVertical * 5,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ),
  );
}
