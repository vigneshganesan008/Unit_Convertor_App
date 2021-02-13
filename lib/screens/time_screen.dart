import 'package:Unit_Convertor/models/models.dart';
import 'package:Unit_Convertor/widgets/DropDownBox.dart';
import 'package:Unit_Convertor/widgets/GridView.dart';
import 'package:Unit_Convertor/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TextEditingController inputTime = TextEditingController(text: "0.0");

  List<Map<String, Object>> calculateTime() {
    var time = double.tryParse(inputTime.text);

    if (time == null) {
      time = 0;
    }
    return [
      {"unit": "Seconds", "value": time.toSecond(currentUnits[2])},
      {"unit": "Minutes", "value": time.toSecond(currentUnits[2]).toMinute},
      {"unit": "Hour", "value": time.toSecond(currentUnits[2]).toHour},
      {"unit": "Day", "value": time.toSecond(currentUnits[2]).toDay},
      {"unit": "Week", "value": time.toSecond(currentUnits[2]).toWeek},
      {"unit": "Month ", "value": time.toSecond(currentUnits[2]).toMonth},
      {"unit": "Year ", "value": time.toSecond(currentUnits[2]).toCalendarYear},
    ];
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(inputTime, () {
                setState(() {});
              }),
              CustomDropDownBox(timeUnits, 2, () {
                setState(() {});
              })
            ],
          ),
        ),
      ),
      CustomGridView(calculateTime()),
    ]);
  }
}
