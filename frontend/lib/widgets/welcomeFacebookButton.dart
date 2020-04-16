import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/models.dart';

@override
Widget welcomeFacebookButton(context) {
  return ButtonTheme(
    minWidth: MediaQuery.of(context).size.width / 1,
    height: SizeConfig.safeBlockVertical * 8,
    child: OutlineButton.icon(
      borderSide: BorderSide(color: Colors.white),
      icon: FaIcon(FontAwesomeIcons.facebookF,
          size: SizeConfig.safeBlockVertical * 3),
      color: Colors.black,
      onPressed: () {},
      label: Text("SIGN UP WITH FACEBOOK"),
    ),
  );
}
