import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/resources/strings.dart';
import 'package:wordle/screens/main_page.dart';
import 'package:wordle/resources/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordleBloc()
        ..emit(WordleAppLauching()),
      child: MaterialApp(
        title: SystemStrings.appTitle,
        theme: theme,
        home: const MainScreen(),
      ),
    );
  }
}

