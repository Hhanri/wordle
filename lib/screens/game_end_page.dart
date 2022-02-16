import 'package:flutter/material.dart';
import 'package:wordle/resources/strings.dart';
import 'package:wordle/widgets/play_button_widget.dart';

class GameEndScreen extends StatelessWidget {
  final String text;
  const GameEndScreen({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary
              ),
            ),
            const PlayButtonWidget(
              text: SystemStrings.playAgain,
              icon: Icon(Icons.refresh)
            )
          ],
        ),
      ),
    );
  }
}
