import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/providers/auth.dart';
import 'package:go2bike/providers/public_operators.dart';

import 'package:go2bike/screens/signup/components/dropdown_button.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _signupKey = GlobalKey();
  Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password': '',
    'repeat-password': '',
    'operator-id': ''
  };

  var _isInit = true;

  var _isLoading = false;
  final _passwordController = TextEditingController(); //??

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PublicOperators>(context, listen: false)
          .fetchOperators()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _submit() async {
    if (!_signupKey.currentState.validate()) {
      //Invalid!
      return;
    }
    _signupKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    // await Provider.of<Auth>(context, listen: false).login(
    //   _authData['email'],
    //   _authData['password'],
    // );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupKey,
      child: Column(
        children: [
          RoundedInputField(
            label: getTranslated(context, 'username'),
            hintText: getTranslated(context, 'username_description'),
            onSaved: (value) {
              print(value);
            },
          ),
          RoundedInputField(
            label: getTranslated(context, 'email'),
            email: true,
            hintText: getTranslated(context, 'email_description'),
            onSaved: (value) {
              print(value);
            },
          ),
          RoundedPasswordField(
            label: getTranslated(context, 'password'),
            hintText: getTranslated(context, 'password_description'),
            onSaved: (value) {
              print(value);
            },
          ),
          RoundedPasswordField(
            label: getTranslated(context, 'repeat_password'),
            hintText: getTranslated(context, 'repeat_password_description'),
            onSaved: (value) {
              print(value);
            },
          ),
          DropdownButtonWidget(
            onSaved: (value) {
              print(value);
            },
          ),
          RoundedButton(
            text: getTranslated(context, 'register'),
            press: _submit,
          ),
        ],
      ),
    );
  }
}
