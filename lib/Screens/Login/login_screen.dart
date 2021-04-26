import 'package:flutter/material.dart';
import 'package:go2bike/screens/login/components/social_media.dart';
import 'package:go2bike/screens/signup/signup_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/screens/login/components/forgot_password.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';

import '../main_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  "assets/images/Logo.png",
              ),
              Text(
                AppLocalization.of(context).translate('signin_title'),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                AppLocalization.of(context).translate('signin_description'),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedInputField(
                label: AppLocalization.of(context).translate('username'),
                hintText: AppLocalization.of(context)
                    .translate('username_description'),
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                label: AppLocalization.of(context).translate('password'),
                hintText: AppLocalization.of(context)
                    .translate('password_description'),
                onChanged: (value) {},
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: ForgotPassword(),
              ),
              RoundedButton(
                text: AppLocalization.of(context).translate('signin'),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPage();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              SocialMedia(),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck(
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
              SizedBox(height: size.height * 0.02),
              LanguageFooter()
            ],
          ),
        ),
      ),
    );
  }
}
