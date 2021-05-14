import 'package:flutter/material.dart';
import 'package:go2bike/localization/app_localization.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          getTranslated(context, 'signin_with'),
        ),
        SizedBox(height: size.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Image.asset(
                "assets/images/facebook.png",
                height: 60.0,
              ),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Image.asset(
                "assets/images/google.png",
                height: 40.0,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            ),
          ],
        )
      ],
    );
  }
}