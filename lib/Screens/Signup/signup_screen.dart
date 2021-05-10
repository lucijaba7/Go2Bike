import 'package:flutter/material.dart';
import 'package:go2bike/components/dropdown_button.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/screens/login/login_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/signup/components/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                   "assets/images/Logo.png",
              ),
              Text(
                AppLocalization.of(context).translate('register_title'),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                AppLocalization.of(context).translate('register_description'),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SignupForm(),
              DropdownButtonWidget(dropdownValue: "Pula", values: ['Pula', 'Rijeka', 'Karlovac'],),
              RoundedButton(
                text: AppLocalization.of(context).translate('register'),
                press: () {},
              ),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck(
                login: false,
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
              LanguageFooter()
            ],
          ),
        ),
      ),
    );
  }
}
