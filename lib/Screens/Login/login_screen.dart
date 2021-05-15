import 'package:flutter/material.dart';

import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';

import 'components/social_media.dart';
import 'components/login_form.dart';

import '../signup/signup_screen.dart';
import '../main_page/main_page.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          padding: EdgeInsets.all(size.width * 0.1),
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
              SizedBox(height: size.height * 0.05),
              LoginForm(),
              SizedBox(height: size.height * 0.02),
              SocialMedia(),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck(
                press: () {
                  // can't import routeName
                  Navigator.of(context).pushNamed('sign-up');
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
