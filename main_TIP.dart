import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool switchValue = false;
  double tip = 0.0;
  int? sRadio;
  var textController = TextEditingController();
  var radioGroupValues = {
    0: "Amazing (20%)",
    1: "Good (18%)",
    2: "Okay (15%)",
  };
  double tipCalculation() {
    var costOfService = double.parse(textController.text ?? "0");
    if (sRadio == 0) {
      tip = costOfService * 0.20;
    } else if (sRadio == 1) {
      tip = costOfService * 0.18;
    } else if (sRadio == 2) {
      tip = costOfService * 0.15;
    }

    if (switchValue) {
      tip = tip.ceilToDouble();
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Time"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          ListTile(
            leading: Icon(Icons.store),
            title: TextField(
              controller: textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cost of service",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          //RADIO BUTTONS
          Column(
            mainAxisSize: MainAxisSize.min,
            children: radioGroupValues.entries
                .map((element) => ListTile(
                      leading: Radio(
                          value: element.key,
                          groupValue: sRadio,
                          onChanged: (int? currentsRadio) {
                            sRadio = currentsRadio;
                            setState(() {});
                          }),
                      title: Text("${element.value}"),
                    ))
                .toList(),
          ),

          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Round tip?"),
            trailing: Switch(
              value: switchValue,
              onChanged: (switchChanged) {
                switchValue = switchChanged;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MaterialButton(
              onPressed: () {
                tipCalculation();
                setState(() {});
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(color: Colors.grey[200]),
              ),
              color: Colors.green,
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Tip amount: \$$tip"),
              ))
        ],
      ),
    );
  }
}
