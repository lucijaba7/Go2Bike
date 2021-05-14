import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _login_form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _login_form,
      child: Column(children: <Widget>[
        RoundedInputField(
          label: getTranslated(context, 'username'),
          hintText: getTranslated(context, 'username_description'),
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          label: getTranslated(context, 'password'),
          hintText: getTranslated(context, 'password_description'),
          onChanged: (value) {},
        ),
      ]),
    );
  }
}
