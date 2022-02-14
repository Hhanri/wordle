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
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 1,
            spreadRadius: 1
          )
        ]
      ),
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onBackground
            ),
          ),
        ),
      ),
    );
  }
}
