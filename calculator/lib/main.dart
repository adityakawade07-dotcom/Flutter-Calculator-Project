import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Calculator());
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        display = "";
      } else if (value == "=") {
        try {
          if (display.contains("+")) {
            var parts = display.split("+");
            int result = int.parse(parts[0]) + int.parse(parts[1]);
            display = result.toString();
          }
        } catch (e) {
          display = "Error";
        }
      } else {
        display = display + value;
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        child: Text(text, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(70),
            color: Colors.black,
            child: Text(
              display,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),

          // Buttons
          Row(
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("+"),
            ],
          ),
          Row(
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("="),
            ],
          ),
          Row(
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("C"),
            ],
          ),
          Row(children: [buildButton("0")]),
        ],
      ),
    );
  }
}
