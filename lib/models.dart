import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

var currentUnits = [LengthUnit.inch];
void updateCurrentUnit(converterType, newValue) {
  currentUnits[0] = newValue;
}

List distanceUnits = [
  LengthUnit.inch,
  LengthUnit.foot,
  LengthUnit.yard,
  LengthUnit.mile,
  LengthUnit.millimeter,
  LengthUnit.centimeter,
  LengthUnit.meter,
  LengthUnit.kilometer,
];

List<Map<String, Object>> measures = [
  {"label": "Distance", "icon": Icons.directions_car},
  {"label": "Temp", "icon": Icons.thermostat_rounded},
  {"label": "Currency", "icon": Icons.euro},
  {"label": "Time", "icon": Icons.timer},
  {"label": "Number", "icon": Icons.confirmation_number},
];
