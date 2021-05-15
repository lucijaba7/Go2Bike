import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import '../../constraints.dart';
import 'components/account_menu.dart';

class Account extends StatefulWidget {
  static const routeName = '/account';

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Text(getTranslated(context, 'my_account')),
            centerTitle: true,
<<<<<<< HEAD
            backgroundColor: kSecondaryColor),
        body: Column(
          children: [
            SizedBox(height: size.height * 0.08),
            Center(
                child: Column(children: [
              Text(
                "IVANA IVIĆ",
                style: TextStyle(
                  fontFamily: "JosefinSansBold",
                  fontSize: 34,
                  color: kPrimaryDarkColor,
=======
            backgroundColor: kSeconaryColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              Center(
                  child: Column(children: [
                Text(
                  "IVANA IVIĆ",
                  style: TextStyle(
                    fontFamily: "JosefinSansBold",
                    fontSize: 34,
                    color: kPrimaryDarkColor,
                  ),
>>>>>>> 50f707ce9d90c304a4af02c4a11215870cb945e3
                ),
                Text(
                  "ivana.ivic@gmail.com",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ])),
              SizedBox(height: size.height * 0.06),
              AccountMenu()
            ],)
        )
      );
  }
}
