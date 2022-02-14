import 'package:flutter/material.dart';
import 'package:wordle/resources/theme.dart';

class CustomKeyWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomKeyWidget({
    Key? key,
    required this.text,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: MyShapes.circularBorders,
        color: Theme.of(context).colorScheme.primary,
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
