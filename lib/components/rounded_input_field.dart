import 'package:flutter/material.dart';
import 'package:go2bike/components/text_field_container.dart';
import 'package:go2bike/constraints.dart';

class RoundedInputField extends StatelessWidget {
  final bool email;
  final String label;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.email = false,
    this.label,
    this.hintText,
    this.icon = Icons.person,
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
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: Icon(
              email ? Icons.mail : Icons.person,
              color: kPrimaryDarkColor,
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
    )]);
  }
}
