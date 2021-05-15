import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/tariffs/components/tariff_card.dart';

import '../../constraints.dart';

class Tariff {
  String name;
  int price;
  String unit;

  Tariff(this.name, this.price, this.unit);
}

class Tariffs extends StatelessWidget {
  static const routeName = '/tariffs';

  @override
  Widget build(BuildContext context) {
    final List<Tariff> tariffList = [
      new Tariff(getTranslated(context, 'standard'), 5,
          getTranslated(context, 'hour')),
      new Tariff(
          getTranslated(context, 'daily'), 150, getTranslated(context, 'day')),
      new Tariff(getTranslated(context, 'monthly'), 250,
          getTranslated(context, 'month'))
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(getTranslated(context, 'tariffs')),
            centerTitle: true,
            backgroundColor: kSecondaryColor),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                height: 315,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  padding: EdgeInsets.only(left: 10.0, top: 30.0),
                  itemCount: tariffList.length,
                  itemBuilder: (context, index) => TariffCard(
                      tariffName: tariffList[index].name,
                      price: tariffList[index].price,
                      unit: tariffList[index].unit),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
              child: Text(
                getTranslated(context, 'additional_info').toUpperCase(),
                style: TextStyle(
                    fontFamily: "JosefinSansBold",
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(getTranslated(context, 'info_text')),
            )
          ],
        )));
  }
}
