import 'package:flutter/material.dart';
import 'package:go2bike/Provider/locale_provider.dart';
import 'package:go2bike/Screens/Signup/signup_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/forgot_password.dart';
import 'package:go2bike/components/language_footer.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/constraints.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//import 'package:go2bike/components/text_field_container.dart';
//import 'package:go2bike/constraints.dart';
//import 'package:go2bike/constraints.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ////////////////////////final provider = Provider.of<LocaleProvider>(context);
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
                "Dobrodošli na Go2Bike!",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                "Nova generacija Smart Bike Sharinga",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedInputField(
                label: "KORISNIČKO IME",
                hintText: "Upišite svoje korisničko ime",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                label: AppLocalizations.of(context).signin,
                //"LOZINKA",
                hintText: "Upišite svoju lozinku",
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
                text: "Prijava",
                press: () {},
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "Prijavite se putem",
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
              LanguageFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
