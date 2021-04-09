import 'dart:math';
import 'package:flutter/material.dart';

class CalculoIacWidget extends StatefulWidget {
  @override
  _CalculoIacWidgetState createState() => _CalculoIacWidgetState();
}

class _CalculoIacWidgetState extends State<CalculoIacWidget> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>(); 
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();

  String _resultadoimc;

  void _calcularimcmasculino(){
    double altura = double.parse(alturacontroller.text)/100.0;
    double peso = double.parse(pesocontroller.text);
    double imc = peso/pow(altura, 2);

    setState(() {
      _resultadoimc = imc.toStringAsFixed(2) + "\n\n" +getClassificacaomasculino(imc);
    });

  }

  void _calcularimcfeminino(){
    double altura = double.parse(alturacontroller.text)/100.0;
    double peso = double.parse(pesocontroller.text);
    double imc = peso/pow(altura, 2);

    setState(() {
      _resultadoimc = imc.toStringAsFixed(2) + "\n\n" +getClassificacaofeminino(imc);
    });

  }

  String getClassificacaomasculino(num imc){
    String strclassificacao;
    if(imc<20.7) strclassificacao = "Abaixo do peso";
    else if((imc>=20.7)&&(imc<=26.4)) strclassificacao = "Peso ideal";
    else if((imc>=26.5)&&(imc<=27.8)) strclassificacao = "Pouco acima do Peso";
    else if((imc>=27.9)&&(imc<=31.1)) strclassificacao = "Acima do peso";
    else if(imc>=31.2) strclassificacao = "Obesidade";
    return strclassificacao;
  }

  String getClassificacaofeminino(num imc){
    String strclassificacao;
    if(imc<19.1) strclassificacao = "Abaixo do peso";
    else if((imc>=19.1)&&(imc<=25.8)) strclassificacao = "Peso ideal";
    else if((imc>=25.9)&&(imc<=27.3)) strclassificacao = "Pouco acima do Peso";
    else if((imc>=27.4)&&(imc<=32.3)) strclassificacao = "Acima do Peso";
    else if(imc>=32.4) strclassificacao = "Obesidade";
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
                return value.isEmpty ? "informe a autura": null; // Ve se digitou algo ou não
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

              controller: pesocontroller,
              validator: (value){
                return value.isEmpty ? "Informe o peso": null;
              },
              decoration: InputDecoration(
                labelText: "Peso em kg",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text(
               _resultadoimc == null ? "" : "IMC: $_resultadoimc",
              ),
            ),
          
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){
                if(_formkey.currentState.validate()){
                  _calcularimcmasculino();
                }
              },
              child: Text('Calcular IMC Masculino'),
              
            ),
          ),

           Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){
                if(_formkey.currentState.validate()){
                  _calcularimcfeminino();
                }
              },
              child: Text('Calcular IMC Feminino'),
              
            ),
          ),
        ],
      ),
    ),
    );
  }
}