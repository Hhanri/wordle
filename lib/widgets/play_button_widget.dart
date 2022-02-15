import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';

class PlayButtonWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  const PlayButtonWidget({
    Key? key,
    required this.text,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:() {
        context.read<WordleBloc>().add(LoadGameEvent());
      },
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            icon
          ],
        ),
      )
    );
  }
}
