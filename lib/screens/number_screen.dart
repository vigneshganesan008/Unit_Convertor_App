import 'package:Unit_Convertor/models/models.dart';
import 'package:Unit_Convertor/widgets/DropDownBox.dart';
import 'package:Unit_Convertor/widgets/GridView.dart';
import 'package:Unit_Convertor/widgets/TextField.dart';
import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  TextEditingController inputNumber = TextEditingController(text: "0");

  List<Map<String, Object>> calculateNumber() {
    var base = int.tryParse(currentUnits[3].toString().split(".")[1]);
    if (inputNumber.text == "" ||
        (base != 16 && (int.tryParse(inputNumber.text) == null))) {
      inputNumber.text = "0";
    }
    var flag = false;
    if (base == 2) {
      inputNumber.text.split("").forEach((element) {
        if (element == "0" || element == "1") {
        } else {
          flag = true;
        }
      });
    }
    if (flag) inputNumber.text = "0";
    return [
      {
        "unit": "Binary",
        "value": int.parse(inputNumber.text, radix: base).toRadixString(2)
      },
      {
        "unit": "Quinary",
        "value": int.parse(inputNumber.text, radix: base).toRadixString(5)
      },
      {
        "unit": "Octal",
        "value": int.parse(inputNumber.text, radix: base).toRadixString(8)
      },
      {
        "unit": "Decimal",
        "value": int.parse(inputNumber.text, radix: base).toRadixString(10)
      },
      {
        "unit": "Hexadecimal",
        "value": int.parse(inputNumber.text, radix: base).toRadixString(16)
      },
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
              CustomTextField(inputNumber, () {
                setState(() {});
              }),
              CustomDropDownBox(numberUnits, 3, () {
                setState(() {});
              })
            ],
          ),
        ),
      ),
      CustomGridView(calculateNumber()),
    ]);
  }
}
