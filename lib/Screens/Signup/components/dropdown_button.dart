import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/operator.dart';
import '../../../providers/public_operators.dart';
import '../../../constraints.dart';

class DropdownButtonWidget extends StatefulWidget {
  final ValueChanged<Operator> onSaved;
  final TextEditingController controller;
  DropdownButtonWidget({Key key, this.onSaved, this.controller})
      : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final publicOperators = Provider.of<PublicOperators>(context);
    Operator dropdownValue = publicOperators.operators[0];
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              offset: Offset(0.0, 0.75),
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<Operator>(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
            ),
          ),
          value: dropdownValue,
          icon: Icon(Icons.arrow_right),
          iconSize: 24,
          elevation: 16,
          onChanged: (Operator newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: publicOperators.operators
              .map<DropdownMenuItem<Operator>>((Operator value) {
            return DropdownMenuItem<Operator>(
              value: value,
              child: Text(
                value.name,
                style: TextStyle(color: kPrimaryDarkColor),
              ),
            );
          }).toList(),
          onSaved: widget.onSaved,
        ),
      ),
    );
  }
}
