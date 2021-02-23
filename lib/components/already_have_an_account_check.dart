import 'package:flutter/material.dart';
import 'package:go2bike/constraints.dart';

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
          login ? "Nemate račun? " : "Imate račun? ",
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrirajte se" : "Prijavite se",
            style: TextStyle(color: kSeconaryColor),
          ),
        ),
      ],
    );
  }
}
