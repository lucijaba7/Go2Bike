import 'package:flutter/material.dart';
import '../constraints.dart';
import '../localization/app_localization.dart';

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
        Text(' '),
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
