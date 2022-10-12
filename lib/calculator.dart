// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              '0',
              style: TextStyle(fontSize: 38),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              '0',
              style: TextStyle(fontSize: 48),
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
                        Button(
                          buttonText: 'C',
                          buttonHeight: 1,
                          buttonColor: Colors.redAccent,
                        ),
                        Button(
                          buttonText: '⌫',
                          buttonHeight: 1,
                          buttonColor: Colors.blue,
                        ),
                        Button(
                          buttonText: '÷',
                          buttonHeight: 1,
                          buttonColor: Colors.blue,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                          buttonText: '7',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '8',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '9',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                          buttonText: '4',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '5',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '6',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                          buttonText: '1',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '2',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '3',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Button(
                          buttonText: '.',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '0',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
                        Button(
                          buttonText: '00',
                          buttonHeight: 1,
                          buttonColor: Colors.grey,
                        ),
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
                      Button(
                        buttonText: 'x',
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                      ),
                    ]),
                    TableRow(children: [
                      Button(
                        buttonText: '-',
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                      ),
                    ]),
                    TableRow(children: [
                      Button(
                        buttonText: '+',
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                      ),
                    ]),
                    TableRow(children: [
                      Button(
                        buttonHeight: 2,
                        buttonText: '=',
                        buttonColor: Colors.redAccent,
                      ),
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
