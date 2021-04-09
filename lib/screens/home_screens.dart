import 'package:aula_imc/screens/calculoimc_screen.dart';
import 'package:aula_imc/widgets/calculoiac_widget.dart';
import 'package:aula_imc/widgets/calculoimc_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculos IMC"),
      ),
      body: Center(
        child: Column (
          children : [
            Text(" "), 

            ElevatedButton(
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalculoImcScreen()),
            );
              },
              child: Text("CalculoIMC"),
            ),

              Text(" "), //Espaço
            ElevatedButton(
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalculoIacWidget()),
            );
              },
              child: Text("Calcular IAC"),
            ),
            
          ],
        ),
      ),
    );
  }
}