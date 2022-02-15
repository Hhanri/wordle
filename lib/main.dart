import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/home_page.dart';
import 'package:wordle/resources/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordleBloc()
        ..add(LoadGameEvent()),
      child: MaterialApp(
        title: 'Wordle',
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}

