import 'dart:async';
import 'dart:io';

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

  startTimer(method) async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, method);
  }

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
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Exit App'),
                content: Text('Do you want to exit the App?'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      startTimer(exit(0));
                    }),
                    child: Text('Yes'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          elevation: 15,
          automaticallyImplyLeading: false,
          title: Text('Calculator'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/scientific');
                    });
                  },
                  child: Icon(Icons.science_outlined)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/settings');
                    });
                  },
                  child: Icon(Icons.settings)),
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
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  )),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: resultFontSize,
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
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
                          Button('C', 1, Theme.of(context).canvasColor),
                          Button('⌫', 1, Theme.of(context).cardColor),
                          Button('÷', 1, Theme.of(context).cardColor),
                        ],
                      ),
                      TableRow(
                        children: [
                          Button('7', 1, Theme.of(context).primaryColor),
                          Button('8', 1, Theme.of(context).primaryColor),
                          Button('9', 1, Theme.of(context).primaryColor),
                        ],
                      ),
                      TableRow(
                        children: [
                          Button('4', 1, Theme.of(context).primaryColor),
                          Button('5', 1, Theme.of(context).primaryColor),
                          Button('6', 1, Theme.of(context).primaryColor),
                        ],
                      ),
                      TableRow(
                        children: [
                          Button('1', 1, Theme.of(context).primaryColor),
                          Button('2', 1, Theme.of(context).primaryColor),
                          Button('3', 1, Theme.of(context).primaryColor),
                        ],
                      ),
                      TableRow(
                        children: [
                          Button('.', 1, Theme.of(context).primaryColor),
                          Button('0', 1, Theme.of(context).primaryColor),
                          Button('00', 1, Theme.of(context).primaryColor),
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
                        Button('×', 1, Theme.of(context).cardColor),
                      ]),
                      TableRow(children: [
                        Button('-', 1, Theme.of(context).cardColor),
                      ]),
                      TableRow(children: [
                        Button('+', 1, Theme.of(context).cardColor),
                      ]),
                      TableRow(children: [
                        Button('=', 2, Theme.of(context).canvasColor),
                      ]),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
