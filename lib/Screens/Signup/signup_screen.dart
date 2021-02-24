import 'package:flutter/material.dart';
import 'package:go2bike/Screens/Login/login_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/dropdown_button.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';

class SignUpScreen extends StatelessWidget {
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
                "Registriraj se na Go2Bike",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Izradi svoj korisnički račun",
              ),
              SizedBox(height: size.height * 0.05),
              RoundedInputField(
                label: "KORISNIČKO IME",
                hintText: "Upišite svoje korisničko ime",
                onChanged: (value) {},
              ),
              RoundedInputField(
                label: "E-MAIL",
                email: true,
                hintText: "Upišite svoju e-mail adresu",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                label: "LOZINKA",
                hintText: "Upišite svoju lozinku",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                label: "PONOVITE LOZINKU",
                hintText: "Ponovno upišite svoju lozinku",
                onChanged: (value) {},
              ),
              DropdownButtonWidget(),
              RoundedButton(
                text: "Registracija",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
