import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/account/components/rent_card.dart';
import '../../constraints.dart';

class BikeRents extends StatelessWidget {
  static const routeName = '/bike-rents';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(getTranslated(context, 'bike_rents')),
            centerTitle: true,
            backgroundColor: kSeconaryColor),
        body: SingleChildScrollView(
            child: Column(
          children: [RentCard()],
        )));
  }
}
