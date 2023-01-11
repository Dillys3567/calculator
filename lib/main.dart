// ignore_for_file: prefer_const_constructors, unused_import

import 'package:calculator/screens/scientific_calculator/scientific_calculator.dart';
import 'package:calculator/screens/simple_calculator/calculator.dart';
import 'package:calculator/utils/constants.dart';
import 'package:calculator/settings/settings.dart';
import 'package:calculator/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/dark_theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    String selectedTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
    if (selectedTheme == 'dark') {
      themeChangeProvider.darkTheme = ThemeMode.dark;
    } else if (selectedTheme == 'light') {
      themeChangeProvider.darkTheme = ThemeMode.light;
    } else if (selectedTheme == 'system') {
      themeChangeProvider.darkTheme = ThemeMode.system;
    }
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'Calculator',
          debugShowCheckedModeBanner: false,
          themeMode: themeChangeProvider.darkTheme,
          theme: LightTheme.lightThemeData(context),
          darkTheme: DarkTheme.darkThemeData(context),
          home: Settings(),
          initialRoute: '/splash',
          routes: {
            '/home': (context) => Calculator(),
            '/settings': (context) => Settings(),
            '/splash': (context) => Splash(),
            '/scientific': (context) => ScientificCalculator(),
          },
        );
      }),
    );
  }
}
