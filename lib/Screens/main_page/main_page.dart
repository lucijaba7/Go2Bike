import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go2bike/widgets/rounded_button.dart';
import 'package:go2bike/flutter_maps/show_map.dart';
import 'package:go2bike/localization/app_localization.dart';
import 'package:go2bike/screens/main_page/components/navigation_drawer.dart';
import '../../constraints.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main-page';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavigationDrawer(),
        body: Stack(children: <Widget>[
          ShowGoogleMap(),
          Positioned(
              top: 70,
              right: 35,
              left: 35,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryLightColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.0,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75),
                      )
                    ]),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      //splashColor: Colors.transparent,
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        print("Otvaraaam");
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                  Image.asset(
                    "assets/images/Logo.png",
                  ),
                ]),
              )),
          Positioned(
            left: 80,
            right: 80,
            bottom: 40,
            child: RoundedButton(
                text: getTranslated(context, 'QR_scanner'),
                val: 0.5,
                color: kSecondaryColor,
                press: () {
                  scanQRCode();
                }),
          )
        ]));
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#6E91BE', //lineColor
          'Cancel',
          //getTranslated(context, 'cancel'),
          false, //flash true/false
          ScanMode.QR);
      print(qrCode);
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      this.qrCode = qrCode;
    });
  }
}
