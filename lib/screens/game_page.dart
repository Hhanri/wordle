import 'package:flutter/material.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/models/letter_model.dart';
import 'package:wordle/widgets/custom_board_tile_widget.dart';
import 'package:wordle/widgets/custom_keyboard_widget.dart';

class GameScreen extends StatelessWidget {
  final WordleLoadedState state;

  const GameScreen({
    Key? key,
    required this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            List<Letter?> letters = state.guesses[(index / 5).floor()].letters;
            int letterCount = letters
                .where((letter) => letter != null)
                .toList()
                .length;
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