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
        body: Builder(
          builder: (BuildContext context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: createTable(context),
              ),
            ))
        ));
  }

  Widget createTable(BuildContext context) {
    List<TableRow> rows = [];
    rows.add(TableRow(children: [
      TableCell(
        child: 
          Text(getTranslated(context, 'date').toUpperCase(), style: TextStyle(
            fontFamily: "JosefinSansBold")
      )),
      TableCell(
        child: 
          Text(getTranslated(context, 'payment_methods').toUpperCase(), style: TextStyle(
            fontFamily: "JosefinSansBold")
      )),
      TableCell(
        child: 
          Text("Status".toUpperCase(), style: TextStyle(
            fontFamily: "JosefinSansBold"), textAlign: TextAlign.center
      )),
      TableCell(
        child: 
          Text(getTranslated(context, 'amount').toUpperCase(), style: TextStyle(
            fontFamily: "JosefinSansBold"),
      )),
    ]));

    for (int i = 0; i < 8; ++i) {
      rows.add(
        TableRow(
          children: [
            TableCell(
              child: 
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text("12.12.2020 \n16:30"),
            )),
            TableCell(
              child: 
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text("Credit card"),
            )),
            TableCell(
              child: 
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: 
                    Chip(
                      label: Text("Paid", style: TextStyle(
                        color: Colors.white,
                      ),),
                      backgroundColor: Colors.green,
                    )
            )),
            TableCell(
              child: 
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text("15.0 HRK"),
            )),
      ]));
    }
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          width: 0.4,
          color: kPrimaryDarkColor,
          style: BorderStyle.solid),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: rows);
  }
}
