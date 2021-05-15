import 'package:flutter/material.dart';
import 'package:go2bike/components/rounded_input_field.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/account/components/dropdown_button.dart';

class PersonalDataForm extends StatefulWidget {
  @override
  _PersonalDataFormState createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        RoundedInputField(
          label: getTranslated(context, 'first_name'),
          hintText: "Ivana",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'last_name'),
          hintText: "Ivić",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'email'),
          email: true,
          hintText: "ivana.ivic@gmail.com",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'oib'),
          email: true,
          hintText: "08125622264",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'phone_number'),
          email: true,
          hintText: "098562332",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'address'),
          email: true,
          hintText: "Jeretova 18",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'city'),
          email: true,
          hintText: "Pula",
          onSaved: (value) {},
        ),
        RoundedInputField(
          label: getTranslated(context, 'postal_code'),
          email: true,
          hintText: "52100",
          onSaved: (value) {},
        ),
        DropdownButtonWidget(),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}
