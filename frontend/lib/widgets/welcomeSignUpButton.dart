import 'package:flutter/material.dart';
import 'package:frontend/screens/signUpScreen.dart';
import '../model/models.dart';

@override
Widget welcomeSignUpButton(context) {
  return ButtonTheme(
    minWidth: MediaQuery.of(context).size.width / 1,
    height: SizeConfig.safeBlockVertical * 8,
    child: RaisedButton(
      color: Colors.red[900],
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: Text("SIGN UP"),
    ),
  );
}
