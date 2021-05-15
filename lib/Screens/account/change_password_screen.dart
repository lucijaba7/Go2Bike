import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';
import '../../constraints.dart';

class ChangePassword extends StatelessWidget {
  static const routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Text(getTranslated(context, 'pass_change')),
            centerTitle: true,
            backgroundColor: kSecondaryColor),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            SizedBox(height: size.height * 0.05),
            RoundedPasswordField(
              label: getTranslated(context, 'password'),
              hintText: getTranslated(context, 'password_description'),
              onSaved: (value) {},
            ),
            RoundedPasswordField(
              label: getTranslated(context, 'repeat_password'),
              hintText: getTranslated(context, 'repeat_password_description'),
              onSaved: (value) {},
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: getTranslated(context, 'change'),
              press: () {},
            ),
          ]),
        )));
  }
}
