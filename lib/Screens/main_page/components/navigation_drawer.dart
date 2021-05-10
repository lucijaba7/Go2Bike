import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/account/account_screen.dart';
import '../../../constraints.dart';
import '../../../custom_icons_icons.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 30.0),
                      child: Text("IVANA IVIĆ", 
                        style: TextStyle(
                          fontFamily: "JosefinSansBold",
                          fontSize: 34,
                          color: kPrimaryDarkColor,
                        ),
                    ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.0),
                  width: size.width,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(color: kPrimaryLightColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(AppLocalization.of(context).translate('account_balance') + " 0" + "kn")
                              ]),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(AppLocalization.of(context).translate('num_of_rides') + " 2")
                              ]),
                            ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Row(
                            children: [
                              Icon(CustomIcons.right_arrow, color: kPrimaryDarkColor, size: 16)
                            ],),
                        )
                    ]),
                  )
                ],
            ),
            buildMenuItem(text: AppLocalization.of(context).translate('my_account').toUpperCase(), icon: CustomIcons.account, onClicked: () => selectedItem(context, 0)),
            buildMenuItem(text: AppLocalization.of(context).translate('payment_methods').toUpperCase(), icon: CustomIcons.credit_card),
            buildMenuItem(text: AppLocalization.of(context).translate('tariffs').toUpperCase(), icon: CustomIcons.money),
            buildMenuItem(text: AppLocalization.of(context).translate('malfunction_report').toUpperCase(), icon: CustomIcons.wrench),
            buildMenuItem(text: AppLocalization.of(context).translate('registrations').toUpperCase(), icon: CustomIcons.key),
            buildMenuItem(text: AppLocalization.of(context).translate('promotions').toUpperCase(), icon: CustomIcons.giftbox),
            buildMenuItem(text: AppLocalization.of(context).translate('logout').toUpperCase(), icon: CustomIcons.logout)
          ]),
    ));
  }

  Widget buildMenuItem({String text, IconData icon, VoidCallback onClicked}) {
    final color = kPrimaryDarkColor;
    final hoverColor = kPrimaryLightColor;

    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(icon, color: color),
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Account(),
        ));
        break;
    }
  }
}
