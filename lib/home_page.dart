import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/models/letter_model.dart';
import 'package:wordle/widgets/custom_board_tile_widget.dart';
import 'package:wordle/widgets/custom_keyboard_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          if (state is WordleLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (state is WordleLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBoard(state),
                const SizedBox(height: 10),
                const CustomKeyboardWidget()
              ],
            );
          }
          if (state is WordleSolvedState) {
            return Center(
              child: FittedBox(
                child: Text(
                "Congratulations, you won !",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Something went wrong"
              ),
            );
          }
        },
      ),
    );
  }

  Container _buildBoard(WordleLoadedState state) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 400,
      width: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          List<Letter?> letters = state.guesses[(index/5).floor()].letters;
          int letterCount = letters.where((letter) => letter != null).toList().length;
          int letterIndex = index % 5;
          return CustomBoardTileWidget(
            letters: letters,
            letterCount: letterCount,
            letterIndex: letterIndex,
          );
        }
      ),
    );
  }
}
