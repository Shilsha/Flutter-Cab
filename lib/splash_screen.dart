import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cab/registration_screen.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const registration_screen())));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 233, 226, 1),
      body: Center(
        child: Image.asset('assets/images/kCb-logo.png'),
      ),
    );
  }
}
