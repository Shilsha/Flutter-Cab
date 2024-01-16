import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cab/viewpages/login_screen.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 233, 226, 1),
      body: Container(
        // color: Color.fromRGBO(234, 233, 226, 1),
        child: Center(
            child: Image.asset(
          'assets/images/Asset 233000 1.png',
          width: 297,
          height: 78,
        )),
      ),
    );
  }
}
