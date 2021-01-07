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
    return SizedBox(
      height: 63,
      width: 155,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0, style: BorderStyle.solid, color: Colors.tealAccent),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 7),
          child: DropdownButton(
            underline: Container(),
            value: currentUnits[widget.convertorType],
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.yellow,
            ),
            iconSize: 35,
            elevation: 20,
            dropdownColor: Colors.black87,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
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
        ),
      ),
    );
  }
}
