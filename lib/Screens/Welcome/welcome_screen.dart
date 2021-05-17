import 'package:flutter/material.dart';
import '../../screens/signup/signup_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../widgets/language_footer.dart';
import '../../widgets/rounded_button.dart';
import '../../constraints.dart';
import '../../localization/app_localization.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        //alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 7,
            width: size.width,
            child: LanguageFooter(),
          ),
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
        ],
      ),
    );
  }
}
