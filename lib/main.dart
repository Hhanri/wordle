import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/home_page.dart';
import 'package:wordle/models/letter_model.dart';
import 'package:wordle/models/word_model.dart';
import 'package:wordle/resources/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordleBloc()
        ..add(
          const LoadGameEvent(
            solution: Word(letters: <Letter> [
              Letter(letter: "G", evaluation: Evaluation.correct),
              Letter(letter: "A", evaluation: Evaluation.correct),
              Letter(letter: "M", evaluation: Evaluation.correct),
              Letter(letter: "E", evaluation: Evaluation.correct),
              Letter(letter: "R", evaluation: Evaluation.correct),
            ])
          )
        )
      ,
      child: MaterialApp(
        title: 'Wordle',
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}

