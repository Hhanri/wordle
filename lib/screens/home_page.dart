import 'package:flutter/material.dart';
import 'package:wordle/resources/strings.dart';
import 'package:wordle/widgets/play_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TitleStrings.appTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary
          ),),
          const PlayButtonWidget(text: SystemStrings.play, icon: Icon(Icons.play_arrow))
        ],
      ),
    );
  }
}
