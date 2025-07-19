import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const NutriPlusApp());
}

class NutriPlusApp extends StatelessWidget {
  const NutriPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutri+',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}