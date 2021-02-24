import 'package:flutter/material.dart';
import 'package:go2bike/components/text_field_container.dart';
import 'package:go2bike/constraints.dart';

class RoundedPasswordField extends StatelessWidget {
  final String label;
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.label,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[ 
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      TextFieldContainer(
        child: TextField(
          obscureText: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
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
      )
    ]);
  }
}
