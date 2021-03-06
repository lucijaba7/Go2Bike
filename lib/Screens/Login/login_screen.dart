import 'package:flutter/material.dart';
import 'components/login_form.dart';
import 'components/social_media.dart';

import '../../widgets/language_footer.dart';
import '../../localization/app_localization.dart';
import '../../widgets/already_have_an_account_check.dart';
import '../../screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: size.width * 0.1, right: size.width * 0.1, top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/Logo.png",
              ),
              Text(
                getTranslated(context, 'signin_title'),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                getTranslated(context, 'signin_description'),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              LoginForm(),
              SizedBox(height: size.height * 0.04),
              SocialMedia(),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpScreen.routeName);
                },
              ),
              SizedBox(height: size.height * 0.02),
              LanguageFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
