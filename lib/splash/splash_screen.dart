// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

String theme = 'system';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void route() {
    Navigator.pushNamed(context, '/home');
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, routeTo);
  }

  void routeTo() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_s0sklx3e.json'),
      ),
    );
  }
}
