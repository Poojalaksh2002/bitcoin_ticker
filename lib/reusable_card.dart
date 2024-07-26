import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key,
      this.initialValueDropDown,
      this.bitCoinRate,
      this.currencyName});

  final initialValueDropDown;
  final bitCoinRate;
  final currencyName;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $currencyName = $bitCoinRate $initialValueDropDown',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
