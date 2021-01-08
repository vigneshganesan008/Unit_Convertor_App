import 'dart:convert';

import 'package:http/http.dart' as http;

List<Map<String, Object>> exchangeRates = [
  {"values": "NULL", "rate": 0}
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
