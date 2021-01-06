import "package:flutter/material.dart";

import 'screens/tab_screen.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(10, 10, 10, 1),
        appBarTheme: AppBarTheme(
            color: Color.fromRGBO(50, 50, 50, 1),
            actionsIconTheme: IconThemeData(color: Colors.tealAccent)),
      ),
      home: TabScreen(),
    );
  }
}
