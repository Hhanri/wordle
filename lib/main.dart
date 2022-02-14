import 'package:flutter/material.dart';
import 'package:wordle/home_page.dart';
import 'package:wordle/resources/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}

