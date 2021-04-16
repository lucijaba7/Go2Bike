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
              ? AppLocalization.of(context).translate('no_account')
              : AppLocalization.of(context).translate('have_account'),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? AppLocalization.of(context).translate('register')
                : AppLocalization.of(context).translate('signin'),
            style: TextStyle(color: kSeconaryColor),
          ),
        ),
      ],
    );
  }
}
