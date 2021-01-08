import 'package:Unit_Convertor/models/models.dart';
import 'package:Unit_Convertor/widgets/DropDownBox.dart';
import 'package:Unit_Convertor/widgets/GridView.dart';
import 'package:Unit_Convertor/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  TextEditingController inputTemp = TextEditingController(text: "0");

  List<Map<String, Object>> calculateTemp() {
    var temp = int.tryParse(inputTemp.text);

    if (temp == null) {
      temp = 0;
    }
    return [
      {"unit": "Celsius", "value": temp.toKelvin(currentUnits[1]).toCelsius},
      {
        "unit": "Fahrenheit",
        "value": temp.toKelvin(currentUnits[1]).toFahrenheit
      },
      {"unit": "Kelvin", "value": temp.toKelvin(currentUnits[1])},
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
              CustomTextField(inputTemp, () {
                setState(() {});
              }),
              CustomDropDownBox(tempUnits, 1, () {
                setState(() {});
              })
            ],
          ),
        ),
      ),
      CustomGridView(calculateTemp()),
    ]);
  }
}
