import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/components/rounded_password_field.dart';
import 'package:go2bike/localization/app_localization.dart';
import '../../constraints.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold( 
      appBar: AppBar(
        title: Text(AppLocalization.of(context).translate('pass_change')),
        centerTitle: true,
        backgroundColor: kSeconaryColor
      ),
      body: SingleChildScrollView(
        child:
          Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                RoundedPasswordField(
                  label: AppLocalization.of(context).translate('password'),
                  hintText: AppLocalization.of(context)
                      .translate('password_description'),
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  label: AppLocalization.of(context).translate('repeat_password'),
                  hintText: AppLocalization.of(context)
                      .translate('repeat_password_description'),
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.02),
                RoundedButton(
                  text: AppLocalization.of(context).translate('change'),
                  press: () {},
                ),
              ]
            ),
          )
    ));
  }
}