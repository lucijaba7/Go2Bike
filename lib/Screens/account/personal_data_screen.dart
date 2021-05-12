import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/account/components/personal_data_form.dart';
import '../../constraints.dart';

class PersonalData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).translate('personal_data')),
        centerTitle: true,
        backgroundColor: kSeconaryColor
      ),
      body: SingleChildScrollView(
        child:
          Center(
            child: Column(
              children: [
                PersonalDataForm(),
                RoundedButton(
                  text: AppLocalization.of(context).translate('save'),
                  press: () {},
                ),
                SizedBox(height: size.height * 0.02),
              ]
            ),
          )
    ));
  }
}