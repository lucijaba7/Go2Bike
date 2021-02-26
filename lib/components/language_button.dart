import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final Function press;

  const LanguageButton({
    Key key,
    this.language = "croatian",
    this.press,
  }) : super(key: key);

  /*String LanguageImg(String x) {
  switch(x) { 
   case 'english': 
      return "assets/images/united-kingdom.png"; 
   case 'croatian':  
      return "assets/images/croatia.png"; 
  }};*/

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.white,
      constraints: BoxConstraints.tight(Size(20, 20)),
      /*child: Image.asset(
          LanguageImg(this.language),
          ),*/
      shape: CircleBorder(),
    );
  }
}
