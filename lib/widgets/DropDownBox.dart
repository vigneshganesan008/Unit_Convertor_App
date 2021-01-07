import 'package:flutter/material.dart';
import 'package:Unit_Convertor/models.dart';

// ignore: must_be_immutable
class CustomDropDownBox extends StatefulWidget {
  List items;
  Function calculate;
  var convertorType;

  CustomDropDownBox(this.items, this.convertorType, this.calculate);

  @override
  _CustomDropDownBoxState createState() => _CustomDropDownBoxState();
}

class _CustomDropDownBoxState extends State<CustomDropDownBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17, left: 5),
      child: DropdownButton(
        value: currentUnits[widget.convertorType],
        hint: Text(
          "Unit",
          style: TextStyle(
            color: Colors.tealAccent,
          ),
        ),
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.deepPurple,
        ),
        iconSize: 35,
        elevation: 20,
        style: TextStyle(color: Colors.deepPurple, fontSize: 18),
        underline: Container(
          height: 3,
          color: Colors.deepPurpleAccent,
        ),
        items: widget.items
            .map(
              (e) => DropdownMenuItem(
                child: Text(e.toString().split(".")[1]),
                value: e,
              ),
            )
            .toList(),
        onChanged: (newValue) {
          setState(() {
            updateCurrentUnit(widget.convertorType, newValue);
            widget.calculate();
          });
        },
      ),
    );
  }
}
