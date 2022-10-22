// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        unselectedWidgetColor: Colors.grey,
        disabledColor: Colors.grey,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.blue),
        cardColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.redAccent,
        primaryColor: Colors.grey,
        textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            )));
  }
}

class DarkTheme {
  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        unselectedWidgetColor: Colors.grey,
        primaryColor: Colors.grey[900],
        disabledColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
        cardColor: Colors.indigo[900],
        canvasColor: Colors.deepOrange[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[700],
        ),
        textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(color: Colors.white)));
  }
}
