import 'package:flutter/material.dart';
import '../constraints.dart';
import '../localization/app_localization.dart';

class RoundedPasswordField extends StatefulWidget {
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
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryDarkColor,
            ),
            suffixIcon: IconButton(
              onPressed: _toggle,
              icon: Icon(
                Icons.visibility,
                color: kPrimaryDarkColor,
              ),
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
            return null;
          },
          onSaved: widget.onSaved,
        ),
      ],
    );
  }
}
