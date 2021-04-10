import 'package:aula_imc/screens/calculoiac_screen.dart';
import 'package:aula_imc/screens/home_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculos',
      home: HomeScreen(),
     //home: CalculoIacScreen()
    );
  }
}
