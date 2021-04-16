import 'package:flutter/material.dart';
import 'package:go2bike/Screens/Signup/signup_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/forgot_password.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';

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
              Positioned(
                child: Image.asset(
                  "assets/images/Logo.png",
                ),
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
                press: () {},
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                AppLocalization.of(context).translate('signup_with'),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Image.asset(
                      "assets/images/facebook.png",
                      height: 60.0,
                    ),
                    shape: CircleBorder(),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Image.asset(
                      "assets/images/google.png",
                      height: 40.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  )
                ],
              ),
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
              LanguageFooter()
            ],
          ),
        ),
      ),
    );
  }
}
