import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/rounded_input_field.dart';
import '../../../localization/app_localization.dart';
import '../../../screens/account/components/dropdown_button.dart';
import '../../../providers/user_profile.dart';

class PersonalDataForm extends StatefulWidget {
  @override
  _PersonalDataFormState createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
      child: Consumer<UserProfile>(
        builder: (ctx, userData, _) => Column(
          children: [
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              label: getTranslated(context, 'first_name'),
              controller: TextEditingController(text: userData.user.name),
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'last_name'),
              controller: TextEditingController(text: userData.user.lastname),
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'email'),
              controller: TextEditingController(text: userData.user.email),
              icon: Icons.mail,
              hintText: "ivana.ivic@gmail.com",
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'oib'),
              controller: TextEditingController(text: userData.user.vatNum),
              icon: Icons.lock,
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'phone_number'),
              controller:
                  TextEditingController(text: userData.user.phoneNumber),
              icon: Icons.phone,
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'address'),
              controller: TextEditingController(text: userData.user.address),
              icon: Icons.house,
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'city'),
              controller: TextEditingController(text: userData.user.city),
              icon: Icons.star,
              onSaved: (value) {},
            ),
            RoundedInputField(
              label: getTranslated(context, 'postal_code'),
              controller: TextEditingController(
                text: userData.user.postalCode.toString(),
              ),
              icon: Icons.contact_mail,
              onSaved: (value) {},
            ),
            SizedBox(height: size.height * 0.02),
            DropdownButtonWidget(),
          ],
        ),
      ),
    );
  }
}
