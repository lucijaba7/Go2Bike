import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/account/bike_rents_screen.dart';
import 'package:go2bike/screens/account/personal_data_screen.dart';
import '../../../constraints.dart';
import '../../../custom_icons_icons.dart';
import '../change_password_screen.dart';

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
            child: AccountMenuItem(text: AppLocalization.of(context).translate('personal_data'))
          ), 
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BikeRents(),
              ));
            },
            child: AccountMenuItem(text: AppLocalization.of(context).translate('bike_rents')),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {},
            child: AccountMenuItem(text: AppLocalization.of(context).translate('payments')),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {},
            child: AccountMenuItem(text: AppLocalization.of(context).translate('rfid_cards')),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangePassword(),
              ));
            },
            child: AccountMenuItem(text: AppLocalization.of(context).translate('pass_change')),
          ),
          Divider(thickness: 1.3),
          InkWell(
            onTap: () {},
            child: AccountMenuItem(text: AppLocalization.of(context).translate('lang_selection')),
          )
      ],),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [Text("$text",
              style: TextStyle(
                fontFamily: "JosefinSansBold",
                fontSize: 18,
                color: kPrimaryDarkColor,
              ),),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Row(children: [Icon(CustomIcons.right_arrow, color: kPrimaryDarkColor, size: 14)]),
          )]
        ),
      );
  }
}


          