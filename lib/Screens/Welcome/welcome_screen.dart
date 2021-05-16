import 'package:flutter/material.dart';
import 'package:go2bike/screens/signup/signup_screen.dart';
import 'package:go2bike/screens/login/login_screen.dart';
import 'package:go2bike/widgets/language_footer.dart';
import 'package:go2bike/widgets/rounded_button.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/localization/app_localization.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/Logo.png",
                ),
                SizedBox(height: size.height * 0.04),
                RoundedButton(
                  text: getTranslated(context, 'signin'),
                  val: 0.8,
                  press: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                ),
                RoundedButton(
                  text: getTranslated(context, 'register'),
                  val: 0.8,
                  color: Colors.white,
                  textColor: kPrimaryDarkColor,
                  press: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                ),
              ],
            ),
            LanguageFooter(),
          ],
        ),
      ),
    );
  }
}
