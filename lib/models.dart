import 'package:flutter_currency_converter/Currency.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

var currentUnits = [
  LengthUnit.inch,
  TemperatureUnit.celsius,
  TimeUnit.second,
  "NumberUnit.2",
  Currency.INR,
];

void updateCurrentUnit(converterType, newValue) {
  currentUnits[converterType] = newValue;
}

var unitRateinUSD = 0.0;

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

List numberUnits = [
  "NumberUnit.2",
  "NumberUnit.5",
  "NumberUnit.8",
  "NumberUnit.10",
  "NumberUnit.16"
];
List currencyUnits = [
  Currency.INR,
  Currency.EUR,
  Currency.USD,
  Currency.JPY,
  Currency.GBP,
  Currency.AUD,
  Currency.MXN,
  'KWD',
  Currency.SGD,
  Currency.MYR,
  Currency.AED,
];

List<Map<String, Object>> measures = [
  {"label": "Distance", "icon": "assets/icons/distance.png"},
  {"label": "Temp", "icon": "assets/icons/hot.png"},
  {"label": "Currency", "icon": "assets/icons/money.png"},
  {"label": "Time", "icon": "assets/icons/chronometer.png"},
  {"label": "Number", "icon": "assets/icons/binary-code.png"},
];
