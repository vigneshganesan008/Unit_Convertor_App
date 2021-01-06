import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  List<Map<String, Object>> unitValue;
  CustomGridView(this.unitValue);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
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
          Text(
            "$value",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(colors: [
          Colors.deepPurple.withOpacity(0.7),
          Colors.tealAccent.withOpacity(0.8)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
    );
  }
}
