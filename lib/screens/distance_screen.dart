import 'package:Unit_Convertor/models.dart';
import 'package:Unit_Convertor/widgets/DropDownBox.dart';
import 'package:Unit_Convertor/widgets/GridView.dart';
import 'package:Unit_Convertor/widgets/TextField.dart';
import 'package:flutter/material.dart';

class DistanceScreen extends StatefulWidget {
  @override
  _DistanceScreenState createState() => _DistanceScreenState();
}

class _DistanceScreenState extends State<DistanceScreen> {
  var inputDistance = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          CustomTextField("Enter Value", inputDistance),
          CustomDropDownBox(distanceUnits, () {
            setState(() {});
          })
        ],
      ),
      CustomGridView([
        {"unit": "XXX", "value": inputDistance.text},
      ]),
    ]);
  }
}
