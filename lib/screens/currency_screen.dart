import 'package:Unit_Convertor/api/currency_api.dart';
import 'package:Unit_Convertor/models.dart';
import 'package:Unit_Convertor/widgets/DropDownBox.dart';
import 'package:Unit_Convertor/widgets/GridView.dart';
import 'package:Unit_Convertor/widgets/TextField.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  TextEditingController inputCur = TextEditingController(text: "0");

  @override
  void initState() {
    getCurrentExchangeRates();
    super.initState();
  }

  List<Map<String, Object>> calculateCurrency() {
    var amt = double.tryParse(inputCur.text);
    if (amt == null) amt = 0.0;
    var from = currentUnits[4].toString();
    var map =
        exchangeRates.where((element) => element["currency"] == from).toList();
    if (map.isNotEmpty) unitRateinUSD = double.parse(map[0]["rate"].toString());

    return [
      {
        "unit": "INR",
        "value": (amt / unitRateinUSD) * exchangeRates[0]["rate"]
      },
      {
        "unit": "EUR",
        "value": (amt / unitRateinUSD) * exchangeRates[1]["rate"]
      },
      {"unit": "USD", "value": amt / unitRateinUSD},
      {
        "unit": "JPY",
        "value": (amt / unitRateinUSD) * exchangeRates[3]["rate"]
      },
      {
        "unit": "GBP",
        "value": (amt / unitRateinUSD) * exchangeRates[4]["rate"]
      },
      {
        "unit": "AUD",
        "value": (amt / unitRateinUSD) * exchangeRates[5]["rate"]
      },
      {
        "unit": "MXN",
        "value": (amt / unitRateinUSD) * exchangeRates[6]["rate"]
      },
      {
        "unit": "KWD",
        "value": (amt / unitRateinUSD) * exchangeRates[7]["rate"]
      },
      {
        "unit": "SGD",
        "value": (amt / unitRateinUSD) * exchangeRates[8]["rate"]
      },
      {
        "unit": "MYR",
        "value": (amt / unitRateinUSD) * exchangeRates[9]["rate"]
      },
      {
        "unit": "AED",
        "value": (amt / unitRateinUSD) * exchangeRates[10]["rate"]
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
              CustomTextField(inputCur, () {
                setState(() {});
              }),
              CustomDropDownBox(currencyUnits, 4, () {
                setState(() {});
              })
            ],
          ),
        ),
      ),
      CustomGridView(calculateCurrency()),
    ]);
  }
}
