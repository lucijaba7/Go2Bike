import 'package:flutter/material.dart';

//Trenutno nebitno.. ako cemo imat neke u kutovima kao krugove onda ima smisla

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/EllipseLightBlue.png",
                width: size.width * 0.3,
              ),
            ),
            child,
          ],
        ));
  }
}
