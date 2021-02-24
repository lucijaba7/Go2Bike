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
            Text(
              "Prijavite se putem",
            ),
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
            AlreadyHaveAnAccountCheck(press: () {})
          ],
        ),
      ),
    );
  }
}
