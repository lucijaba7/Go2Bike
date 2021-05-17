import 'package:flutter/material.dart';
import '../change_password_screen.dart';
import '../payments_screen.dart';
import '../../../localization/app_localization.dart';
import '../../../screens/account/bike_rents_screen.dart';
import '../../../screens/account/personal_data_screen.dart';
import '../../../constraints.dart';
import '../../../custom_icons_icons.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonalData(),
              ));
            },
            child: AccountMenuItem(
              text: getTranslated(context, 'personal_data') == null
                  ? ''
                  : getTranslated(context, 'personal_data'),
            ),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BikeRents(),
              ));
            },
            child: AccountMenuItem(
              text: getTranslated(context, 'bike_rents') == null
                  ? ''
                  : getTranslated(context, 'bike_rents'),
            ),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Payments(),
              ));
            },
            child: AccountMenuItem(
              text: getTranslated(context, 'payments') == null
                  ? ''
                  : getTranslated(context, 'payments'),
            ),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {},
            child: AccountMenuItem(
              text: getTranslated(context, 'rfid_cards') == null
                  ? ''
                  : getTranslated(context, 'rfid_cards'),
            ),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangePassword(),
              ));
            },
            child: AccountMenuItem(
              text: getTranslated(context, 'pass_change') == null
                  ? ''
                  : getTranslated(context, 'pass_change'),
            ),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {},
            child: AccountMenuItem(
              text: getTranslated(context, 'lang_selection') == null
                  ? ''
                  : getTranslated(context, 'lang_selection'),
            ),
          )
        ],
      ),
    );
  }
}

class AccountMenuItem extends StatelessWidget {
  final String text;

  const AccountMenuItem({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 25, bottom: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          Text(
            "$text",
            style: TextStyle(
              fontFamily: "JosefinSansBold",
              fontSize: 18,
              color: kPrimaryDarkColor,
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Row(children: [
            Icon(CustomIcons.right_arrow, color: kPrimaryDarkColor, size: 14)
          ]),
        )
      ]),
    );
  }
}
