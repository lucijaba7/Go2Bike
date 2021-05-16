import 'package:flutter/material.dart';
import 'package:go2bike/widgets/text_field_container.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/localization/app_localization.dart';

class RoundedPasswordField extends StatelessWidget {
  final String label;
  final String hintText;

  final ValueChanged<String> onSaved;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.label,
    this.hintText,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryDarkColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryDarkColor,
            ),
            contentPadding: EdgeInsets.all(15.0),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value.isEmpty || value.length < 5) {
              return getTranslated(context, 'invalid-password');
            }
          },
          onSaved: onSaved,
        ),
      ],
    );
  }
}
