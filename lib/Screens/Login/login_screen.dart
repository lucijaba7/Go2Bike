import 'package:flutter/material.dart';
import 'package:go2bike/Screens/Signup/signup_screen.dart';
import 'package:go2bike/components/already_have_an_account_check.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../main_page.dart';

//import 'package:go2bike/components/text_field_container.dart';
//import 'package:go2bike/constraints.dart';
//import 'package:go2bike/constraints.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  //bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

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
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              controller: userNameController,
              label: "KORISNIČKO IME",
              hintText: "Upišite svoje korisničko ime",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              label: "LOZINKA",
              hintText: "Upišite svoju lozinku",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Prijava",
              press: () {
                /*setState(() {
                  _isLoading = true;
                });*/
                signIn(userNameController.text, passwordController.text);
              },
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
            )
          ],
        ),
      ),
    );
  }

  signIn(String username, String password) async {
    Map data = {
      'grant_type': password,
      'username': username,
      'passwod': password
    };
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Response response = await post(
      "https://go2bikeapitest.azurewebsites.net/token",
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept-Language': 'hr'
      },
    );

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        //isLoading = false;
        sharedPreferences.setString("token", jsonData('token'));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
            (Route<dynamic> route) => false);
      });
    } else {
      print(response.body);
    }
  }
}
