import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:go2bike/screens/signup/signup_screen.dart';
import 'package:go2bike/screens/login/login_screen.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/localization/app_localization.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: Container(
      //   height: size.height,
      //   width: double.infinity,
      //   child: Center(
      body: Center(
        heightFactor: 4,
        child: FooterView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: size.height * 0.04),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Logo.png",
                    ),
                    SizedBox(height: size.height * 0.04),
                    RoundedButton(
                      text: getTranslated(context, 'signin'),
                      press: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                    ),
                    RoundedButton(
                      text: getTranslated(context, 'register'),
                      color: Colors.white,
                      textColor: kPrimaryDarkColor,
                      press: () {
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
          footer: Footer(
            child: LanguageFooter(),
          ),
        ),
      ),
    );
  }
}
