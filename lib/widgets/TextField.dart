import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  Function calculate;
  CustomTextField(this.controller, this.calculate);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Color.fromRGBO(181, 126, 220, 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(100)),
                  borderSide: BorderSide(color: Colors.tealAccent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(100)),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 5))),
          cursorColor: Colors.tealAccent,
          cursorWidth: 4,
          cursorRadius: Radius.circular(10),
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white, fontSize: 20),
          onChanged: (_) => calculate(),
          keyboardAppearance: Brightness.dark,
        ),
      ),
    );
  }
}
