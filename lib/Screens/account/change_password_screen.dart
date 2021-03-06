import 'package:flutter/material.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_password_field.dart';
import '../../localization/app_localization.dart';
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
            child: Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
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
              val: 0.4,
              press: () {},
            ),
          ]),
        )));
  }
}
