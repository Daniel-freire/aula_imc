import 'package:aula_imc/widgets/calculoIMC_widget.dart';
import 'package:aula_imc/widgets/calculoiac_widget.dart';
import 'package:flutter/material.dart';

class CalculoIacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculo IAC',
        ),
      ),
      body: CalculoIacWidget(),   
      
    );
  }
}