import 'package:flutter/material.dart';
import 'package:frontend/model/models.dart';
import 'package:frontend/widgets/welcomeFacebookButton.dart';
import 'package:frontend/widgets/welcomeLogo.dart';
import 'package:frontend/widgets/welcomeSignInButton.dart';
import 'package:frontend/widgets/welcomeSignUpButton.dart';
import 'package:frontend/widgets/welcomeTitle.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                welcomeLogo(context),
                welcomeTitle(context),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1.2,
                ),
                welcomeSignUpButton(context),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1.2,
                ),
                welcomeFacebookButton(context),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.2,
                ),
                welcomeSignInButton(context),
              ],
            ),
          ),
        ));
  }
}
