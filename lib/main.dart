import 'package:bitcoin_ticker/coin_dart.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlueAccent,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
