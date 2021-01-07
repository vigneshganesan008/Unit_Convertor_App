import 'package:Unit_Convertor/models.dart';
import 'package:Unit_Convertor/widgets/DropDownBox.dart';
import 'package:Unit_Convertor/widgets/GridView.dart';
import 'package:Unit_Convertor/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class DistanceScreen extends StatefulWidget {
  @override
  _DistanceScreenState createState() => _DistanceScreenState();
}

class _DistanceScreenState extends State<DistanceScreen> {
  TextEditingController inputDistance = TextEditingController();

  List<Map<String, Object>> calculateDistance() {
    var distance = int.tryParse(inputDistance.text);

    if (distance == null) {
      distance = 0;
    }
    return [
      {"unit": "Inches", "value": distance.toMeter(currentUnits[0]).toInch},
      {"unit": "Feet", "value": distance.toMeter(currentUnits[0]).toFoot},
      {"unit": "Yards", "value": distance.toMeter(currentUnits[0]).toYard},
      {"unit": "Miles", "value": distance.toMeter(currentUnits[0]).toMile},
      {
        "unit": "Millimeter",
        "value": distance.toMeter(currentUnits[0]).toMillimeter
      },
      {
        "unit": "Centimeter",
        "value": distance.toMeter(currentUnits[0]).toCentimeter
      },
      {"unit": "Meter", "value": distance.toMeter(currentUnits[0])},
      {
        "unit": "Kilometer",
        "value": distance.toMeter(currentUnits[0]).toKilometer
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField("Enter Value", inputDistance, () {
              setState(() {});
            }),
            CustomDropDownBox(distanceUnits, 0, () {
              setState(() {});
            })
          ],
        ),
      ),
      CustomGridView(calculateDistance()),
    ]);
  }
}
