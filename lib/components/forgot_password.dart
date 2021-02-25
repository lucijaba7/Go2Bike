import 'package:flutter/material.dart';
import 'package:go2bike/constraints.dart';

class ForgotPassword extends StatelessWidget {
  final Function press;
  const ForgotPassword({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        "Zaboravili ste lozinku?",
        style: TextStyle(color: kSeconaryColor),
      ),
    );
  }
}
