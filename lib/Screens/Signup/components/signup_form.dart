import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';

class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedInputField(
          label: AppLocalization.of(context).translate('username'),
          hintText: AppLocalization.of(context)
              .translate('username_description'),
          onChanged: (value) {},
        ),
        RoundedInputField(
          label: AppLocalization.of(context).translate('email'),
          email: true,
          hintText:
              AppLocalization.of(context).translate('email_description'),
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          label: AppLocalization.of(context).translate('password'),
          hintText: AppLocalization.of(context)
              .translate('password_description'),
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          label: AppLocalization.of(context).translate('repeat_password'),
          hintText: AppLocalization.of(context)
              .translate('repeat_password_description'),
          onChanged: (value) {},
        ),
      ]
    );
  }
}