// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        print('here');
      } else if (buttonText == '⌫') {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
        print('here');
      } else if (buttonText == '=') {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('×', '*');
        print(expression);
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel conMod = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, conMod)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation += buttonText;
          print('here');
          print(buttonText);
        }
      }
    });
  }

  Widget Button(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.science_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,
                style: TextStyle(
                  fontSize: equationFontSize,
                )),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Button('C', 1, Colors.redAccent),
                        Button('⌫', 1, Colors.blue),
                        Button('÷', 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button('7', 1, Colors.grey),
                        Button('8', 1, Colors.grey),
                        Button('9', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button('4', 1, Colors.grey),
                        Button('5', 1, Colors.grey),
                        Button('6', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button('1', 1, Colors.grey),
                        Button('2', 1, Colors.grey),
                        Button('3', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button('.', 1, Colors.grey),
                        Button('0', 1, Colors.grey),
                        Button('00', 1, Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      Button('×', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      Button('-', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      Button('+', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      Button('=', 2, Colors.redAccent),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
