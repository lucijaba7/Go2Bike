import 'package:flutter/material.dart';
import 'package:go2bike/Screens/Login/login_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/dropdown_button.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';

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
              //SizedBox(height: size.height * 0.02),
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
              RoundedInputField(
                label: AppLocalization.of(context).translate('username'),
                hintText: AppLocalization.of(context)
                    .translate('username_description'),
                onChanged: (value) {},
              ),
              RoundedInputField(
                label: AppLocalization.of(context).translate('email'),
                email: true,
                hintText:
                    AppLocalization.of(context).translate('email_description'),
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                label: AppLocalization.of(context).translate('password'),
                hintText: AppLocalization.of(context)
                    .translate('password_description'),
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                label: AppLocalization.of(context).translate('repeat_password'),
                hintText: AppLocalization.of(context)
                    .translate('repeat_password_description'),
                onChanged: (value) {},
              ),
              DropdownButtonWidget(),
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
