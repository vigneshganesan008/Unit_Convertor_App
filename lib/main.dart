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
        backgroundColor: Colors.black,
      ),
      home: TabScreen(),
    );
  }
}
