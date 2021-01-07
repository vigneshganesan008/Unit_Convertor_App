import 'package:flutter/material.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

var currentUnits = [LengthUnit.inch, TemperatureUnit.celsius, TimeUnit.second];
void updateCurrentUnit(converterType, newValue) {
  currentUnits[converterType] = newValue;
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

List tempUnits = [
  TemperatureUnit.celsius,
  TemperatureUnit.fahrenheit,
  TemperatureUnit.kelvin,
];

List timeUnits = [
  TimeUnit.second,
  TimeUnit.minute,
  TimeUnit.hour,
  TimeUnit.day,
  TimeUnit.week,
  TimeUnit.month,
  TimeUnit.calendarYear,
];

List<Map<String, Object>> measures = [
  {"label": "Distance", "icon": Icons.directions_car},
  {"label": "Temp", "icon": Icons.thermostat_rounded},
  {"label": "Currency", "icon": Icons.euro},
  {"label": "Time", "icon": Icons.timer},
  {"label": "Number", "icon": Icons.confirmation_number},
];
