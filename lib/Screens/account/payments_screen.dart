import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';
import '../../constraints.dart';

class Payments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'payments'),
        ),
        centerTitle: true,
        backgroundColor: kSecondaryColor),
      body: SingleChildScrollView(
        child: createTable()
      )
    );
  }

  Widget createTable() {
    List<TableRow> rows = [];
    rows.add(TableRow(children: [
        Text("Datum"),
        Text("Način plaćanja"),
        Text("Status"),
        Text("Iznos")
    ]));

    for (int i = 0; i < 10; ++i) {
      rows.add(TableRow(children: [
        Text("number " + i.toString()),
        Text("squared " + (i * i).toString()),
        Text("ss"),
        Text("Izssnos")
      ]));
    }
    return Table(
      border: TableBorder(horizontalInside: BorderSide(width: 0.8, color: kPrimaryDarkColor, style: BorderStyle.solid)),
      children: rows);
  }
}