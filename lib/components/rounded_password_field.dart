import 'package:flutter/material.dart';
import 'package:go2bike/components/text_field_container.dart';
import 'package:go2bike/constraints.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Upišite svoju lozinku",
          icon: Icon(
            Icons.lock,
            color: kPrimaryDarkColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryDarkColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
