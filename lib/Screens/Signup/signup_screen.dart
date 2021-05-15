import 'package:flutter/material.dart';
import 'package:go2bike/screens/signup/components/dropdown_button.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/screens/login/login_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/signup/components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up';

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
              // Image.asset(
              //   "assets/images/Logo.png",
              // ),
              Text(
                getTranslated(context, 'register_title'),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                getTranslated(context, 'register_description'),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SignupForm(),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
              LanguageFooter()
            ],
          ),
        ),
      ),
    );
  }
}
