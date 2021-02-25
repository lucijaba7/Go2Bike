import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
              "Uspješan login!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
      )
    );
  }
}