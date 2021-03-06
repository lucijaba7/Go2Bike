import 'package:flutter/material.dart';
import '../constraints.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(kSecondaryColor),
      ),
    );
  }
}
