import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../../providers/user_profile.dart';
import '../../widgets/rounded_button.dart';
import '../../flutter_maps/show_map.dart';
import '../../localization/app_localization.dart';
import '../../screens/main_page/components/navigation_drawer.dart';
import '../../constraints.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String qrCode = 'Unknown';

  var _isInit = true;
  var _isLoading = false;

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<UserProfile>(context).fetchUserProfile().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      body: Stack(
        children: <Widget>[
          ShowGoogleMap(),
          Positioned(
              top: size.height * 0.05,
              right: 30.0,
              left: 30.0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                        //splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.menu,
                          color: kPrimaryDarkColor,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    ),
                    Image.asset(
                      "assets/images/Logo.png",
                    ),
                    SizedBox(width: 24.0)
                  ],
                ),
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
        ],
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#6E91BE', //lineColor
          'Cancel',
          //getTranslated(context, 'cancel'),
          false, //flash true/false
          ScanMode.QR);
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      this.qrCode = qrCode;
    });
  }
}
