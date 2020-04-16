import 'package:flutter/material.dart';
import 'package:frontend/screens/loginScreen.dart';
import '../model/models.dart';

@override
Widget welcomeSignInButton(context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Text(
        'SIGN IN',
        style: TextStyle(
            fontSize: SizeConfig.safeBlockVertical * 2.2,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        textAlign: TextAlign.left,
      ),
    ),
  );
}
