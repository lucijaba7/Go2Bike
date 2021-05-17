import 'package:flutter/material.dart';
import '../constraints.dart';
import '../main.dart';

class LanguageFooter extends StatefulWidget {
  final Widget child;

  const LanguageFooter({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _LanguageFooterState createState() => _LanguageFooterState();
}

class _LanguageFooterState extends State<LanguageFooter> {
  _changeLanguage(String language) async {
    Locale _temp;
    switch (language) {
      case 'en':
        _temp = Locale(language, 'UK');
        break;
      case 'hr':
        _temp = Locale(language, 'HR');
        break;
    }

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child:
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //LanguageButton(),
            RawMaterialButton(
              onPressed: () {
                _changeLanguage('en');
              },
              elevation: 2.0,
              fillColor: Colors.white,
              constraints: BoxConstraints.tight(Size(20, 20)),
              child: Image.asset(
                "assets/images/united-kingdom.png",
              ),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {
                _changeLanguage('hr');
              },
              elevation: 2.0,
              fillColor: Colors.white,
              constraints: BoxConstraints.tight(Size(20, 20)),
              child: Image.asset(
                "assets/images/croatia.png",
              ),
              shape: CircleBorder(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("UTE d.o.o "),
            Icon(
              Icons.copyright,
              color: kPrimaryDarkColor,
              size: 14,
            ),
            Text("2020."),
          ],
        ),
      ],
    );
  }
}
