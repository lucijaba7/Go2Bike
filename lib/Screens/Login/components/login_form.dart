import 'package:flutter/material.dart';
import 'package:go2bike/screens/main_page/main_page.dart';
import 'package:go2bike/widgets/rounded_button.dart';
import 'package:go2bike/widgets/rounded_input_field.dart';
import 'package:go2bike/widgets/rounded_password_field.dart';
import 'package:go2bike/widgets/loader.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/providers/auth.dart';
import '../../../constraints.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _isLoading = false;
  //final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          getTranslated(context, "error"),
        ),
        content: Text(message),
        actions: <Widget>[
          RoundedButton(
            text: 'OK',
            val: 0.2,
            press: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_loginKey.currentState.validate()) {
      //Invalid!
      return;
    }
    _loginKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'],
        _authData['password'],
      );
      Navigator.of(context).pushReplacementNamed(MainPage.routeName);
    } catch (error) {
      final errorMessage = getTranslated(context, "error_message_default");
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _loginKey,
      child: Column(
        children: <Widget>[
          RoundedInputField(
            label: getTranslated(context, 'username'),
            hintText: getTranslated(context, 'username_description'),
            onSaved: (value) {
              _authData['email'] = value;
            },
          ),
          RoundedPasswordField(
            label: getTranslated(context, 'password'),
            hintText: getTranslated(context, 'password_description'),
            onSaved: (value) {
              _authData['password'] = value;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  getTranslated(context, 'forgot_password'),
                  style: TextStyle(color: kSecondaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          _isLoading
              ? Loader()
              : RoundedButton(
                  text: getTranslated(context, 'signin'),
                  val: 0.8,
                  press: _submit,
                ),
        ],
      ),
    );
  }
}
