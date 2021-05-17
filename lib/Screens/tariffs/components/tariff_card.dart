import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../widgets/rounded_button.dart';
import '../../../localization/app_localization.dart';
import '../../../constraints.dart';

class TariffCard extends StatelessWidget {
  final tariffName;
  final price;
  final unit;

  const TariffCard({Key key, this.tariffName, this.price, this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(tariffName.toUpperCase(),
                    style: TextStyle(
                        fontFamily: "JosefinSansBold",
                        fontSize: 20,
                        fontWeight: FontWeight.w900))
              ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 34.0, right: 8.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/dollar.png",
                    height: 55,
                    width: 70,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontFamily: "JosefinSansBold",
                              color: kPrimaryDarkColor,
                              fontSize: 55),
                          children: [
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, -45),
                            child: Text(
                              'kn',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                        TextSpan(text: price.toString()),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(5, -8),
                            child: Text(
                              "/ ${unit}",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      ])),
                ],
              ),
            ),
            RoundedButton(
              text: getTranslated(context, 'buy_code'),
              val: 0.4,
              press: () {},
            ),
          ]),
        ));
  }
}
