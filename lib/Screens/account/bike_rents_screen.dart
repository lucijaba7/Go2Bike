import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import '../../constraints.dart';

class BikeRents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text(AppLocalization.of(context).translate('bike_rents')),
        centerTitle: true,
        backgroundColor: kSeconaryColor
      ),
      body: SingleChildScrollView(
        child: Text("aa")
    ));
  }
}