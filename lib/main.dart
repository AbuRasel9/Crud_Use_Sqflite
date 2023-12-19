import 'package:flutter/material.dart';
import 'package:registration_screen/data_screen.dart';
import 'package:registration_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataScreeen(),
    );
  }
}
