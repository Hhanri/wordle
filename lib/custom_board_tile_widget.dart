import 'package:flutter/material.dart';
import 'package:wordle/resources/theme.dart';

class CustomBoardTileWidget extends StatelessWidget {
  const CustomBoardTileWidget({Key? key}) : super(key: key);

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
      child: const Center(
        child: Text(""),
      ),
    );
  }
}
