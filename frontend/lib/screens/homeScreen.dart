import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/screens/welcomeScreen.dart';
import 'dart:convert' show json, base64, ascii;
import 'package:frontend/model/models.dart';

class HomePage extends StatelessWidget {
  HomePage(this.jwt, this.payload);

  factory HomePage.fromBase64(String jwt) => HomePage(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Home",
          ),
        ),
        body: Center(
          child: FutureBuilder(
              future:
                  http.read('$SERVER_IP/data', headers: {"Authorization": jwt}),
              builder: (context, snapshot) => snapshot.hasData
                  ? Column(
                      children: <Widget>[
                        Text("${payload['username']}"),
                        Text(snapshot.data,
                            style: Theme.of(context).textTheme.display1),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                            storage.deleteAll();
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    )
                  : snapshot.hasError
                      ? Text("An error occurred")
                      : CircularProgressIndicator()),
        ),
      );
}
