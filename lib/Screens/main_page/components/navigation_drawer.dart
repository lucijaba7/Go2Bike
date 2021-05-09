import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.only(left: 25.0),
                  width: size.width,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor),
            
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                          child: Column(children: [
                            Row(children: [Text("Stanje računa: 0kn")]),
                            const SizedBox(height: 12),
                            Row(
                              children: [Text("Broj vožnji: 2")])
                          ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0, right: 2.0),
                          child: Column(children: [Icon(CustomIcons.right_arrow, color: kPrimaryDarkColor)],),
                        )
                      ]),
                  )
                
              ],),
            //const SizedBox(height: 48),
            buildMenuItem(text: 'MOJ RAČUN', icon: CustomIcons.account, onClicked: () => selectedItem(context, 0)),
            buildMenuItem(text: 'NAČINI PLAĆANJA', icon: CustomIcons.credit_card),
            buildMenuItem(text: 'TARIFE', icon: CustomIcons.money),
            buildMenuItem(text: 'PRIJAVA KVARA', icon: CustomIcons.wrench),
            buildMenuItem(text: 'REGISTRACIJE', icon: CustomIcons.key),
            buildMenuItem(text: 'PROMOCIJE', icon: CustomIcons.giftbox),
            buildMenuItem(text: 'ODJAVA', icon: CustomIcons.logout)
          ],
        ),
      ),
    );
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
