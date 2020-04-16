import 'package:flutter/material.dart';
import 'package:frontend/widgets/emailAddressTitle.dart';
import 'package:frontend/widgets/emailFIeld.dart';
import 'package:frontend/widgets/forgetPassword.dart';
import 'package:frontend/widgets/loginWidget.dart';
import 'package:frontend/widgets/passwordFIeld.dart';
import 'package:frontend/widgets/passwordTitle.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "LOGIN",
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              emailAddressTitle(context),
              SizedBox(height: 10.0),
              emailField(context, _usernameController),
              SizedBox(height: 30.0),
              passwordTitle(context),
              SizedBox(height: 10.0),
              passwordField(context, _passwordController),
              SizedBox(height: 50.0),
              logInWidget(context, _usernameController, _passwordController),
              SizedBox(height: 30.0),
              forgetPassword(context),
            ],
          ),
        ),
      ),
    );
  }
}
