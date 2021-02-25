import 'package:flutter/material.dart';
import 'package:go2bike/components/language_button.dart';
import 'package:go2bike/constraints.dart';
import 'package:go2bike/l10n/l10n.dart';
import 'package:go2bike/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguageFooter extends StatelessWidget {
  final Widget child;

  const LanguageFooter({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            //LanguageButton(),
            RawMaterialButton(
              onPressed: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false)
                        .setLocale(Locale('en'));
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
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false)
                        .setLocale(Locale('hr'));
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
