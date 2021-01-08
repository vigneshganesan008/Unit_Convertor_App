import 'package:flutter/material.dart';
import 'package:Unit_Convertor/models/models.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

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
      padding: const EdgeInsets.only(bottom: 7.0, top: 5),
      child: SizedBox(
        height: 58,
        width: 155,
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.0,
                  style: BorderStyle.solid,
                  color: Colors.deepPurpleAccent),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 7),
            child: DropdownButton(
              isExpanded: true,
              underline: Container(),
              value: currentUnits[widget.convertorType],
              icon: Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 6),
                child: Image.asset("assets/icons/down-arrow.png"),
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
                      child: e == TimeUnit.calendarYear
                          ? Text("year")
                          : e.toString().length == 3
                              ? Text(e)
                              : Text(e.toString().split(".")[1]),
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
      ),
    );
  }
}
