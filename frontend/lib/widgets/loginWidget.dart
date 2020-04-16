import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/models.dart';
import '../screens/homeScreen.dart';
import 'alertDialogWidget.dart';

Future<String> attemptLogIn(String username, String password) async {
  var res = await http.post("$SERVER_IP/login",
      body: {"username": username, "password": password});
  if (res.statusCode == 200) return res.body;
  return null;
}

@override
Widget logInWidget(
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
            var jwt = await attemptLogIn(username, password);
            if (jwt != null) {
              storage.write(key: "jwt", value: jwt);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage.fromBase64(jwt)));
            } else {
              displayDialog(context, "An Error Occurred",
                  "No account was found matching that username and password");
            }
          },
          child: Text("SIGN IN")));
}
