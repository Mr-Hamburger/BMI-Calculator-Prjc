import 'package:bmi/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//MyApp is a stateless widget that returns MaterialApp widget:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
