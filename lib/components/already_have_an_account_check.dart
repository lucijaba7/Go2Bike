import 'package:flutter/material.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/localization/app_localization.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? getTranslated(context, 'no_account')
              : getTranslated(context, 'have_account'),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? getTranslated(context, 'register')
                : getTranslated(context, 'signin'),
            style: TextStyle(color: kSecondaryColor),
          ),
        ),
      ],
    );
  }
}
