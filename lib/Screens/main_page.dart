import 'package:flutter/material.dart';
import 'package:go2bike/components/navigation_drawer.dart';

import '../constraints.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(  //znam da nije tako na prototipu, ali za sad nek bude tako
        title: Text("Main page"),
        backgroundColor: kSeconaryColor,
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
              "Uspješan login!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),)
            ]
          )
        )
      ),
    );
  }
}


