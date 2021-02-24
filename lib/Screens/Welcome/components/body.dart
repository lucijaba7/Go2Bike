import 'package:flutter/material.dart';
import 'package:go2bike/Screens/Signup/signup_screen.dart';
import 'package:go2bike/Screens/Login/login_screen.dart';
import 'package:go2bike/Screens/Welcome/components/background.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/constraints.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
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
            SizedBox(height: size.height * 0.04),
            RoundedButton(
              text: "Prijava",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Registracija",
              color: Colors.white,
              textColor: kPrimaryDarkColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
