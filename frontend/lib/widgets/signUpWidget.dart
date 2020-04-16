import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/models.dart';
import 'alertDialogWidget.dart';

Future<int> attemptSignUp(String username, String password) async {
  var res = await http.post('$SERVER_IP/signup',
      body: {"username": username, "password": password});
  return res.statusCode;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

@override
Widget signUpWidget(
    BuildContext context,
    TextEditingController _usernameController,
    TextEditingController _passwordController) {
  return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1,
      height: 65.0,
      child: RaisedButton(
          color: Colors.red[900],
          onPressed: () async {
            var username = _usernameController.text;
            var password = _passwordController.text;

            if (username.length < 4)
              displayDialog(context, "Invalid Email address",
                  "The email should be at least 4 characters long");
            else if (password.length < 4)
              displayDialog(context, "Invalid Password",
                  "The password should be at least 4 characters long");
            else if (validateEmail(username) != null)
              displayDialog(context, "Invalid Email address",
                  "Please add a valid email address");
            else {
              var res = await attemptSignUp(username, password);
              if (res == 201) {
                displayDialog(
                    context, "Success", "The user was created. Log in now.");
              } else if (res == 409)
                displayDialog(context, "That username is already registered",
                    "Please try to sign up using another username or log in if you already have an account.");
              else {
                displayDialog(context, "Error", "An unknown error occurred.");
              }
            }
          },
          child: Text("SIGN UP")));
}
