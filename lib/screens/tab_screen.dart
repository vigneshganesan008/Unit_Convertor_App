import 'package:Unit_Convertor/screens/distance_screen.dart';
import 'package:Unit_Convertor/screens/temperature_screen.dart';
import 'package:Unit_Convertor/screens/time_screen.dart';
import 'package:flutter/material.dart';

import '../models.dart';

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
      {"screen": DistanceScreen(), "title": Text("Currency Convertor")},
      {"screen": TimeScreen(), "title": Text("Time Convertor")},
      {"screen": DistanceScreen(), "title": Text("Number Convertor")},
    ];
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
        centerTitle: true,
        leading: Icon(
          Icons.calculate_rounded,
          size: 45,
        ),
        title: screens[selectedPageIndex]["title"],
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
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.tealAccent,
      currentIndex: selectedPageIndex,
      onTap: selectPage,
      items: measures
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e["icon"]), label: e["label"]))
          .toList(),
    );
  }
}
