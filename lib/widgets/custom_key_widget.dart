import 'package:flutter/material.dart';
import 'package:wordle/models/letter_model.dart';
import 'package:wordle/resources/theme.dart';

class CustomKeyWidget extends StatelessWidget {
  final Set<Letter?> evaluation;
  final String text;
  final Function() onTap;
  const CustomKeyWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.evaluation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Letter?> letterEvaluation = evaluation.where((letter) => letter!.letter == text).toList();
    Color color = (letterEvaluation.isNotEmpty)
      ? letterEvaluation.any((letter) => letter!.evaluation == Evaluation.correct)
        ? Theme.of(context).colorScheme.secondary
        : letterEvaluation.any((letter) => letter!.evaluation == Evaluation.present)
          ? Colors.yellow
          : letterEvaluation.any((letter) => letter!.evaluation == Evaluation.missing)
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.primary;

    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        color: color,
        boxShadow: MyStyles.shadow
      ),
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: MyStyles.textStyle
          ),
        ),
      ),
    );
  }
}
