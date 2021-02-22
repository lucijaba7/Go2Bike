import 'package:flutter/material.dart';
import 'package:go2bike/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/Logo.png",
            ),
          ),
          /*SvgPicture.asset(
            "assets/images/Logo.svg",
          ),*/
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            onPressed: () {},
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
