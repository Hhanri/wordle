import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/screens/game_page.dart';
import 'package:wordle/screens/home_page.dart';
import 'package:wordle/screens/loading_page.dart';
import 'package:wordle/screens/game_end_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WordleBloc, WordleState>(
        listenWhen: (previous, current) {
          if (current is WordleLoadedState) {
            return current.isNotInDictionary;
          }
          return false;
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Word not in dictionary"),
              duration: Duration(milliseconds: 400),
            )
          );
        },
        builder: (context, state) {
          if (state is WordleAppLauching) {
            return const HomeScreen();
          }
          if (state is WordleLoadingState) {
            return const LoadingScreen();
          }
          if (state is WordleLoadedState) {
            return GameScreen(state: state);
          }
          if (state is WordleSolvedState) {
            return const GameEndScreen(text: "Congratulations, you won !");
          }
          if (state is WordleLostState) {
            return const GameEndScreen(text: "You Lost");
          }
          return const Center(
            child: Text(
              "Something went wrong"
            ),
          );
        },
      ),
    );
  }
}
