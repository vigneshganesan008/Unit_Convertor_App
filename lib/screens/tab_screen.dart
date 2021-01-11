import 'package:Unit_Convertor/api/currency_api.dart';
import 'package:Unit_Convertor/screens/currency_screen.dart';
import 'package:Unit_Convertor/screens/distance_screen.dart';
import 'package:Unit_Convertor/screens/number_screen.dart';
import 'package:Unit_Convertor/screens/temperature_screen.dart';
import 'package:Unit_Convertor/screens/time_screen.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> screens;

  @override
  initState() {
    screens = [
      {"screen": DistanceScreen(), "title": Text("Distance Convertor")},
      {"screen": TemperatureScreen(), "title": Text("Temperature Convertor")},
      {"screen": CurrencyScreen(), "title": Text("Currency Convertor")},
      {"screen": TimeScreen(), "title": Text("Time Convertor")},
      {"screen": NumberScreen(), "title": Text("Number Convertor")},
    ];
    getCurrentExchangeRates();
    super.initState();
  }

  var selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            'assets/icons/double-arrow.png',
            height: 5,
            width: 5,
          ),
        ),
        title: screens[selectedPageIndex]["title"],
        actions: selectedPageIndex == 2
            ? [
                IconButton(
                    icon: Image.asset('assets/icons/refresh.png'),
                    onPressed: getCurrentExchangeRates)
              ]
            : [],
      ),
      body: screens[selectedPageIndex]["screen"],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(50, 50, 50, 1),
      elevation: 5,
      selectedFontSize: 15,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.teal,
      currentIndex: selectedPageIndex,
      onTap: selectPage,
      items: measures
          .map((e) => BottomNavigationBarItem(
              icon: Image.asset(e["icon"]), label: e["label"]))
          .toList(),
    );
  }
}
