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
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2
        )
      ),
      child: (letterCount > letterIndex)
        ? Text(
            letters[letterIndex]!.letter,
            style: const TextStyle(
              fontSize: 20
            ),
          )
        : const Text("")
    );
  }
}
