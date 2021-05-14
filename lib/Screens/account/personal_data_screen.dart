import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_button.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/account/components/personal_data_form.dart';
import '../../constraints.dart';

class PersonalData extends StatelessWidget {
  static const routeName = '/personal-data';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Text(getTranslated(context, 'personal_data')),
            centerTitle: true,
            backgroundColor: kSeconaryColor),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            PersonalDataForm(),
            RoundedButton(
              text: getTranslated(context, 'save'),
              press: () {},
            ),
            SizedBox(height: size.height * 0.02),
          ]),
        )));
  }
}
