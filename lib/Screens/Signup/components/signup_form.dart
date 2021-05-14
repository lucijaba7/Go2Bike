import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _signup_form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signup_form,
      //child: SingleChildScrollView(
      child: Column(
        children: [
          RoundedInputField(
            label: getTranslated(context, 'username'),
            hintText: getTranslated(context, 'username_description'),
            onChanged: (value) {},
          ),
          RoundedInputField(
            label: getTranslated(context, 'email'),
            email: true,
            hintText: getTranslated(context, 'email_description'),
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            label: getTranslated(context, 'password'),
            hintText: getTranslated(context, 'password_description'),
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            label: getTranslated(context, 'repeat_password'),
            hintText: getTranslated(context, 'repeat_password_description'),
            onChanged: (value) {},
          ),
        ],
      ),
      //),
    );
  }
}
