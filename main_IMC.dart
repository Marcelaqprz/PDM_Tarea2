import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tCP = TextEditingController();
  var tCA = TextEditingController();
  var FinalIMC;
  double female = 0, male = 0, a2 = 0, imc = 0;
  bool pressedF = false, pressedM = false;
  double imcCalculation() {
    var peso = double.parse(tCP.text);
    var altura = double.parse(tCA.text);

    imc = (peso / (pow(altura, 2)));
    FinalIMC = imc.toStringAsFixed(2);
    return 0.0;
  }

  void imcFemale() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tu IMC: $FinalIMC"),
        content: Text("Tabla del IMC para mujeres\n\n" +
            " Edad    IMC ideal\n" +
            "16-17     19-24\n" +
            "18-18     19-24\n" +
            "19-24     19-24\n" +
            "25-34     20-25\n" +
            "35-44     21-26\n" +
            "45-54     22-27\n" +
            "55-64     23-28\n" +
            "65-90     25-30\n"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Aceptar")),
        ],
      ),
    );
  }

  void imcMale() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tu IMC: $FinalIMC"),
        content: Text("Tabla del IMC para hombres\n\n" +
            " Edad    IMC ideal\n" +
            "16-17     19-24\n" +
            "18-18     20-25\n" +
            "19-24     20-25\n" +
            "25-34     22-27\n" +
            "35-54     23-38\n" +
            "55-64     24-29\n" +
            "65-90     25-30\n"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Aceptar")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular IMC"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("Ingrese sus datos para calcular el IMC"),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pressedF = !pressedF;
                        });
                      },
                      icon: Icon(Icons.female,
                          color: (pressedF) ? Colors.indigo : Colors.black)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          pressedM = !pressedM;
                        });
                      },
                      icon: Icon(Icons.male,
                          color: (pressedM) ? Colors.indigo : Colors.black)),
                ],
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.square_foot_rounded),
            title: TextField(
              controller: tCA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingresar altura (Metros)"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.monitor_weight_rounded),
            title: TextField(
              controller: tCP,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingresar peso (Kg)"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButton(
              onPressed: () {
                imcCalculation();
                if (pressedF == true) {
                  imcFemale();
                } else if (pressedM == true) {
                  imcMale();
                }
              },
              child: Text(
                "Calcular",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
