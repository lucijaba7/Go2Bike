import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../localization/app_localization.dart';
import '../../../screens/account/account_screen.dart';
import '../../../screens/tariffs/tariffs_screen.dart';
import '../../../providers/user_profile.dart';
import '../../../providers/auth.dart';
import '../../../constraints.dart';
import '../../../custom_icons_icons.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Material(
      color: Colors.white,
      child: ListView(children: [
        Column(
          children: [
            Consumer<UserProfile>(
              builder: (ctx, userData, _) => Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 15.0),
                    child: FittedBox(
                      child: Text(
                        userData.user.name == null
                            ? getTranslated(context, 'welcome_user')
                                .toUpperCase()
                            : (userData.user.name +
                                    ' ' +
                                    userData.user.lastname)
                                .toUpperCase(),
                        style: TextStyle(
                          fontFamily: "JosefinSansBold",
                          fontSize: 34,
                          color: kPrimaryDarkColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0),
              width: size.width,
              height: size.height * 0.09,
              decoration: BoxDecoration(color: kPrimaryLightColor),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(getTranslated(context, 'account_balance') +
                                  " 0" +
                                  "kn")
                            ]),
                            const SizedBox(height: 12),
                            Row(children: [
                              Text(
                                  getTranslated(context, 'num_of_rides') + " 2")
                            ]),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Row(
                        children: [
                          Icon(CustomIcons.right_arrow,
                              color: kPrimaryDarkColor, size: 16)
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
        buildMenuItem(
            text: getTranslated(context, 'my_account').toUpperCase(),
            icon: CustomIcons.account,
            onClicked: () => selectedItem(context, 0)),
        buildMenuItem(
            text: getTranslated(context, 'payment_methods').toUpperCase(),
            icon: CustomIcons.credit_card),
        buildMenuItem(
            text: getTranslated(context, 'tariffs').toUpperCase(),
            icon: CustomIcons.money,
            onClicked: () => selectedItem(context, 2)),
        buildMenuItem(
            text: getTranslated(context, 'malfunction_report').toUpperCase(),
            icon: CustomIcons.wrench),
        buildMenuItem(
            text: getTranslated(context, 'registrations').toUpperCase(),
            icon: CustomIcons.key),
        buildMenuItem(
            text: getTranslated(context, 'promotions').toUpperCase(),
            icon: CustomIcons.giftbox),
        buildMenuItem(
          text: getTranslated(context, 'logout').toUpperCase(),
          icon: CustomIcons.logout,
          onClicked: () {
            Navigator.of(context).pop();
            // Nagivator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
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
        Navigator.of(context).pushNamed(Account.routeName);
        break;
      case 1:
        break;
      case 2:
        Navigator.of(context).pushNamed(Tariffs.routeName);
        break;
    }
  }
}
