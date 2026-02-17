import 'package:flutter/material.dart';
import 'calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "";
      } else if (value == "=") {
        try {
          result = calculateResult(input);
        } catch (e) {
          result = "Error";
        }
      } else {
        input = input + value;
      }
    });
  }

  String calculateResult(String expression) {
    if (expression.contains("+")) {
      var parts = expression.split("+");
      return (double.parse(parts[0]) + double.parse(parts[1])).toString();
    } else if (expression.contains("-")) {
      var parts = expression.split("-");
      return (double.parse(parts[0]) - double.parse(parts[1])).toString();
    } else if (expression.contains("*")) {
      var parts = expression.split("*");
      return (double.parse(parts[0]) * double.parse(parts[1])).toString();
    } else if (expression.contains("/")) {
      var parts = expression.split("/");
      return (double.parse(parts[0]) / double.parse(parts[1])).toString();
    } else {
      return expression;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.black,
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(color: Colors.white70, fontSize: 24),
                  ),
                  SizedBox(height: 10),
                  Text(
                    result,
                    style: TextStyle(color: Colors.green, fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                buildRow(["7", "8", "9", "/"]),
                buildRow(["4", "5", "6", "*"]),
                buildRow(["1", "2", "3", "-"]),
                buildRow(["0", "C", "=", "+"]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((text) {
          return CalculatorButton(
            text: text,
            color: isOperator(text) ? Colors.orange : Colors.grey,
            onPressed: () => onButtonPressed(text),
          );
        }).toList(),
      ),
    );
  }

  bool isOperator(String text) {
    return text == "+" ||
        text == "-" ||
        text == "*" ||
        text == "/" ||
        text == "=";
  }
}
