import 'dart:io';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_dart.dart';
import 'reusable_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? initialValueDropDown = "USD";

  Map<String, dynamic> coinValues = {'BTC': '0', 'ETH': '0', 'LTC': '0'};

  Future checkRes(value) async {
    CoinData coinData = CoinData();
    try {
      var rateObject = await coinData.getCoinData(initialValueDropDown);
      setState(() {
        coinValues = rateObject
            .map((key, value) => MapEntry(key, value.toStringAsFixed(2)));
      });
    } catch (e) {
      print("Pooja handle this Error:: $e");
    }
  }

  Widget getDropDownAndroidList() {
    List<DropdownMenuItem<String>> dropDownMenuItem = [];
    for (String currency in currenciesList) {
      var menuItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownMenuItem.add(menuItem);
    }
    return DropdownButton<String>(
        value: initialValueDropDown,
        items: dropDownMenuItem,
        onChanged: (value) {
          checkRes(value);
          setState(() {
            initialValueDropDown = value;
          });
        });
  }

  Widget getCupertinoPicker() {
    List<Text> dropDownMenuItem = [];
    for (String currency in currenciesList) {
      var menuItem = Text(currency);

      dropDownMenuItem.add(menuItem);
    }
    return CupertinoPicker(
        itemExtent: 30.0,
        onSelectedItemChanged: (value) => print(value),
        children: dropDownMenuItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReusableCard(
                    initialValueDropDown: initialValueDropDown,
                    bitCoinRate: coinValues['BTC'],
                    currencyName: "BTC"),
                ReusableCard(
                    initialValueDropDown: initialValueDropDown,
                    bitCoinRate: coinValues['ETH'],
                    currencyName: "ETH"),
                ReusableCard(
                    initialValueDropDown: initialValueDropDown,
                    bitCoinRate: coinValues['LTC'],
                    currencyName: "LTC"),
              ],
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isAndroid
                  ? getDropDownAndroidList()
                  : getCupertinoPicker()),
        ],
      ),
    );
  }
}
