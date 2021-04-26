import 'package:flutter/material.dart';
import 'package:go2bike/screens/account/account_screen.dart';

import '../constraints.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(height: 48),
            buildMenuItem(
                text: 'MOJ RAČUN',
                icon: Icons.account_box_rounded,
                onClicked: () => selectedItem(context, 0)),
            buildMenuItem(text: 'NAČINI PLAĆANJA', icon: Icons.credit_card),
            buildMenuItem(text: 'TARIFE', icon: Icons.monetization_on_outlined),
            buildMenuItem(text: 'PRIJAVA KVARA', icon: Icons.control_point),
            buildMenuItem(text: 'REGISTRACIJE', icon: Icons.vpn_key_rounded),
            buildMenuItem(text: 'PROMOCIJE', icon: Icons.pages),
            buildMenuItem(text: 'ODJAVA', icon: Icons.exit_to_app_outlined)
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({String text, IconData icon, VoidCallback onClicked}) {
    final color = kPrimaryDarkColor;
    final hoverColor = kPrimaryLightColor;

    return ListTile(
      leading: Icon(icon, color: color),
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
