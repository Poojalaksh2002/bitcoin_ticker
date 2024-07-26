import 'dart:convert';

import 'package:bitcoin_ticker/constants.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<Map<String, dynamic>> getCoinData(value) async {
    Map<String, double> cryptoListRates = {};
    for (String currencyList in cryptoList) {
      print('LISTCHECK::$currencyList');
      final response = await http.get(Uri.parse(
          '$base_url/v1/exchangerate/$currencyList/$value/?apikey=$API_KEY'));
      if (response.statusCode == 200) {
        var decodedData = await jsonDecode(response.body);
        double rate = decodedData['rate'];
        cryptoListRates[currencyList] = rate;
      } else {
        print(Future.error);
      }
    }
    return cryptoListRates;
  }
}
