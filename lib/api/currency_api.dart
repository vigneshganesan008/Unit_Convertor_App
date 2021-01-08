import 'dart:convert';

import 'package:http/http.dart' as http;

List<Map<String, Object>> exchangeRates = [
  {"currency": "INR", "rate": 0.0},
  {"currency": "EUR", "rate": 0.0},
  {"currency": "USD", "rate": 0.0},
  {"currency": "JPY", "rate": 0.0},
  {"currency": "GBP", "rate": 0.0},
  {"currency": "AUD", "rate": 0.0},
  {"currency": "MXN", "rate": 0.0},
  {"currency": "KWD", "rate": 0.0},
  {"currency": "SGD", "rate": 0.0},
  {"currency": "MYR", "rate": 0.0},
  {"currency": "AED", "rate": 0.0},
];

Future<void> getCurrentExchangeRates() async {
  var response = await http.get(
      "https://v6.exchangerate-api.com/v6/581cd21b35114a45d6aede72/latest/USD");
  var allExchangeRates = json.decode(response.body)['conversion_rates'];
  exchangeRates = [
    {"currency": "INR", "rate": allExchangeRates["INR"]},
    {"currency": "EUR", "rate": allExchangeRates["EUR"]},
    {"currency": "USD", "rate": allExchangeRates["USD"]},
    {"currency": "JPY", "rate": allExchangeRates["JPY"]},
    {"currency": "GBP", "rate": allExchangeRates["GBP"]},
    {"currency": "AUD", "rate": allExchangeRates["AUD"]},
    {"currency": "MXN", "rate": allExchangeRates["MXN"]},
    {"currency": "KWD", "rate": allExchangeRates["KWD"]},
    {"currency": "SGD", "rate": allExchangeRates["SGD"]},
    {"currency": "MYR", "rate": allExchangeRates["MYR"]},
    {"currency": "AED", "rate": allExchangeRates["AED"]},
  ];
}
