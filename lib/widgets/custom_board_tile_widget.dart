import 'package:flutter/material.dart';
import 'package:wordle/models/letter_model.dart';
import 'package:wordle/resources/theme.dart';

class CustomBoardTileWidget extends StatelessWidget {
  final List<Letter?> letters;
  final int letterCount;
  final int letterIndex;
  const CustomBoardTileWidget({
    Key? key,
    required this.letters,
    required this.letterCount,
    required this.letterIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color color = (letterCount > letterIndex)
      ? letters[letterIndex]!.evaluation == Evaluation.pending
        ? Colors.transparent
        : letters[letterIndex]!.evaluation == Evaluation.correct
          ? Theme.of(context).colorScheme.secondary
          : letters[letterIndex]!.evaluation == Evaluation.present
            ? Colors.yellow
            : Colors.transparent
      : Colors.transparent;

    Color textColor = (letterCount > letterIndex)
      ? letters[letterIndex]!.evaluation == Evaluation.pending || letters[letterIndex]!.evaluation == Evaluation.missing
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.background
      : Theme.of(context).colorScheme.secondary;

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        color: color,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2
        )
      ),
      child: Center(
        child: (letterCount > letterIndex)
          ? Text(
              letters[letterIndex]!.letter,
              style: TextStyle(
                fontSize: 20,
                color: textColor
              ),
            )
          : const Text("")
      )

    );
  }
}
