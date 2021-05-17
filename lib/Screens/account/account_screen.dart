import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/account_menu.dart';
import '../../localization/app_localization.dart';
import '../../constraints.dart';
import '../../providers/user_profile.dart';

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
            title: Text(
              getTranslated(context, 'my_account'),
            ),
            centerTitle: true,
            backgroundColor: kSecondaryColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              Center(
                child: Consumer<UserProfile>(
                  builder: (ctx, userData, _) => Column(
                    children: [
                      Text(
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
                      Text(
                        userData.user.email,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              AccountMenu()
            ],
          ),
        ));
  }
}
