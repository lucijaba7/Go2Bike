import 'package:flutter/material.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
//import 'package:go2bike/components/text_field_container.dart';
//import 'package:go2bike/constraints.dart';
//import 'package:go2bike/constraints.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
              ),
            ),
            Text(
              "Nova generacija Smart Bike Sharinga",
            ),
            RoundedInputField(
              hintText: "Upišite svoje korisničko ime",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Prijava",
              press: () {},
            ),
            AlreadyHaveAnAccountCheck(press: () {})
          ],
        ),
      ),
    );
  }
}
