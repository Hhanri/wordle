import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/resources/strings.dart';
import 'package:wordle/screens/game_page.dart';
import 'package:wordle/screens/home_page.dart';
import 'package:wordle/screens/loading_page.dart';
import 'package:wordle/screens/game_end_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: BlocConsumer<WordleBloc, WordleState>(
            listenWhen: (previous, current) {
              if (current is WordleLoadedState) {
                return current.isNotInDictionary; //triggers listener when returns true (when not in dictionary)
              }
              return false;
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(SystemStrings.notInDictionary),
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
                return const GameEndScreen(text: TitleStrings.youWon);
              }
              if (state is WordleLostState) {
                return const GameEndScreen(text: TitleStrings.youLost);
              }
              return const Center(
                child: Text(
                  SystemStrings.somethingWentWrong
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
