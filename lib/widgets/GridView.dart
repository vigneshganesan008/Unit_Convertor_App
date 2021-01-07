import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomGridView extends StatelessWidget {
  List<Map<String, Object>> unitValue;
  CustomGridView(this.unitValue);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
        ),
        children: unitValue
            .map((e) => buildContainer(e["unit"], e["value"]))
            .toList(),
      ),
    );
  }

  Container buildContainer(unit, value) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$unit",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              value.toStringAsFixed(2),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(colors: [
          Colors.tealAccent.withOpacity(0.8),
          Colors.deepPurple.withOpacity(0.7),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
    );
  }
}
