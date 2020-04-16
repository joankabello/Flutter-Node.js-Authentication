import 'package:flutter/material.dart';
import 'package:frontend/screens/welcomeScreen.dart';
import 'dart:convert' show json, base64, ascii;
import 'package:frontend/screens/homeScreen.dart';
import 'package:frontend/model/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red[900],
          accentColor: Colors.red[800]),
      home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.data != "") {
              var str = snapshot.data;
              var jwt = str.split(".");

              if (jwt.length != 3) {
                return WelcomeScreen();
              } else {
                var payload = json.decode(
                    ascii.decode(base64.decode(base64.normalize(jwt[1]))));
                if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
                    .isAfter(DateTime.now())) {
                  return HomePage(str, payload);
                } else {
                  return WelcomeScreen();
                }
              }
            } else {
              return WelcomeScreen();
            }
          }),
    );
  }
}
