import 'package:flutter/material.dart';

import '../../../constraints.dart';

//kartica je jako fus i ruznaaa
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
                  padding: const EdgeInsets.only(left: 20.0, top: 25.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("14. prosinca 2020.",
                            style: TextStyle(
                              fontFamily: "JosefinSansBold",
                              fontSize: 22
                          )),
                      ]),
                      const SizedBox(height: 12),
                      Row(children: [
                        Text("12:00 - 12:15",
                          style: TextStyle(
                            fontFamily: "JosefinSansBold",
                            fontSize: 16
                        )),
                      ]),
                    ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Chip(
                    label: Text("Finished", style: TextStyle(
                      color: Colors.white,
                    ),),
                    backgroundColor: Color(0xffb37BDA1),
                    padding: EdgeInsets.all(0.0),
                  ),
                ),
              ]),
              Divider(thickness: 1.0, indent: 18.0, endIndent: 18.0),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("RentId: 12118"),
                    Text("Validacija: UserProduct"),
                ]),
              ),
              Divider(thickness: 1.0, indent: 18.0, endIndent: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("HRK\n15,00"),
                  Column(
                    children: [
                      Icon(Icons.watch_later_outlined, color: kPrimaryDarkColor),
                      Text("15min")
                  ],),
                  Column(
                    children: [
                      Icon(Icons.verified_user_outlined, color: kPrimaryDarkColor),
                      Text("prepaid")
                  ],),
                  Column(children: [
                    Image.asset(
                      "assets/images/bike.png",
                      height: 75,
                      width: 90,
                    ),
                  ],),

              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 8.0),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:  DecorationImage(
                              fit: BoxFit.fill,
                              image:  AssetImage("assets/images/croatia.png"))
                    ))),
                    Text("Grad Delnice", style: TextStyle(fontFamily: "JosefinSansBold")),
                  ],),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text("TEST_OP2", style: TextStyle(fontFamily: "JosefinSansBold")),
                    )
              ])
        ],),
      ),
    );
  }
}


