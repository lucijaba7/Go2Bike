import 'package:flutter/material.dart';

import '../constraints.dart';

class DropdownButtonWidget extends StatefulWidget {
  String dropdownValue; //Pula
  List<String> values;
  DropdownButtonWidget({Key key, this.dropdownValue, this.values}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          // neki shadow na botun
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.0,
              blurRadius: 5.0,
              offset: Offset(0.0, 0.75), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              value: widget.dropdownValue,
              icon: Icon(Icons.arrow_right),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  widget.dropdownValue = newValue;
                });
              },
              items: widget.values
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: kPrimaryDarkColor),
                  ),
                );
              }).toList(),
            ))),
      ),
    );
  }
}
