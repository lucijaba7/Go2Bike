import 'package:flutter/material.dart';
import 'package:go2bike/widgets/text_field_container.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/localization/app_localization.dart';

class RoundedInputField extends StatelessWidget {
  final bool email;
  final String label;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onSaved;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.email = false,
    this.label,
    this.hintText,
    this.icon = Icons.person,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          //onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              email ? Icons.mail : Icons.person,
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
          keyboardType: email ? TextInputType.emailAddress : TextInputType.name,
          validator: (value) {
            if (value.isEmpty) {
              return getTranslated(context, "invalid-input");
            }
            return null;
          },
          onSaved: onSaved,
        ),
      ],
    );
  }
}
