import 'package:flutter/material.dart';

class RentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("14. prosinca 2020.",
                            style: TextStyle(
                              fontFamily: "JosefinSansBold",
                              fontSize: 22
                            ))
                          ]),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Text("12:00 - 12:15",
                                style: TextStyle(
                                  fontFamily: "JosefinSansBold",
                                  fontSize: 16
                                ))
                          ]),
                    ]),
                ),
              ]
            )
        ],),
      ),
    );
  }
}


