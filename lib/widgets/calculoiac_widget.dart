import 'dart:math';

import 'package:flutter/material.dart';

class CalculoIacWidget extends StatefulWidget {
  @override
  _CalculoIacWidgetState createState() => _CalculoIacWidgetState();
}

class _CalculoIacWidgetState extends State<CalculoIacWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>(); 
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController quadrilcontroller = TextEditingController();

  String _resultadoiac;

  void _calculariacmasculino(){
    double altura = double.parse(alturacontroller.text)/100;
    double quadril = double.parse(quadrilcontroller.text);
    double iac = quadril/(altura*(sqrt(altura)))-18;


    setState(() {
      _resultadoiac = iac.toStringAsFixed(2) + "\n\n" +getClassificacaoiacmasculino(iac);
    }
    );
  }

  void _calculariacfeminino(){
    double altura = double.parse(alturacontroller.text)/100;
    double quadril = double.parse(quadrilcontroller.text);
    double iac = quadril/(altura*(sqrt(altura)))-18;


    setState(() {
      _resultadoiac = iac.toStringAsFixed(2) + "\n\n" +getClassificacaoiacfeminino(iac);
    }
    );
  }

  String getClassificacaoiacmasculino(num iac){
    String strclassificacao;
    if((iac>=8.0)&&(iac<=20.0)) strclassificacao = "Normal";
    else if((iac>=21.0)&&(iac<=25.0)) strclassificacao = "Sobrepeso";
    else if(iac>25.0) strclassificacao = "Obesidade";
    return strclassificacao;
  }
  String getClassificacaoiacfeminino(num iac){
    String strclassificacao;
    if((iac>=21.0)&&(iac<=32.0)) strclassificacao = "Normal";
    else if((iac>=33.0)&&(iac<=38.0)) strclassificacao = "Sobrepeso";
    else if(iac>38.0) strclassificacao = "Obesidade";
    return strclassificacao;
  }

  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
    child: Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),

            child: TextFormField(
              keyboardType: TextInputType.number, //Teclado que será exibido para o usuário
              controller: alturacontroller,
              validator: (value){
                return value.isEmpty ? "informe a altura": null; // Ve se digitou algo ou não
              },
              decoration: InputDecoration(
                labelText: "Altura em cm",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,

              controller: quadrilcontroller,
              validator: (value){
                return value.isEmpty ? "Informe a circunferência de seu quadril": null;
              },
              decoration: InputDecoration(
                labelText: "Circunferencia do quadril em cm",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text(
               _resultadoiac == null ? "" : "IAC: $_resultadoiac",
              ),
            ),
          
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){
                if(_formkey.currentState.validate()){
                  _calculariacmasculino();
                }
              },
              child: Text('Calcular IAC Masculino'),
            ),
          ),

           Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){
                if(_formkey.currentState.validate()){
                  _calculariacfeminino();
                }
              },
              child: Text('Calcular IAC Feminino'),
            ),
          ),

          
        ],
      ),
    ),
    );
  }
}