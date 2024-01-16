import 'package:flutter/material.dart';
import 'package:flutter_cab/home_screen.dart';
import 'package:flutter_cab/home_screen_1.dart';
import 'package:flutter_cab/registration_screen.dart';
import 'package:flutter_cab/round_trip.dart';
import 'package:flutter_cab/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const registration_screen(),
    );
  }
}
