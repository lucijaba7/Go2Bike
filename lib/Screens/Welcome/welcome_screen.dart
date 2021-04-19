import 'package:flutter/material.dart';
import 'package:go2bike/screens/signup/signup_screen.dart';
import 'package:go2bike/screens/login/login_screen.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/localization/app_localization.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.04),
              Image.asset(
                "assets/images/Logo.png",
              ),
              SizedBox(height: size.height * 0.04),
              RoundedButton(
                text: AppLocalization.of(context).translate('signin'),
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
                text: AppLocalization.of(context).translate('register'), //getTranslated(context, 'register'),
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
              LanguageFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

