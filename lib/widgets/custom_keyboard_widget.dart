import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/blocs/wordle_bloc.dart';
import 'package:wordle/models/letter_model.dart';
import 'package:wordle/models/word_model.dart';
import 'package:wordle/resources/theme.dart';
import 'package:wordle/widgets/custom_key_widget.dart';

class CustomKeyboardWidget extends StatelessWidget {
  const CustomKeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> firstRow = ["A", "Z", "E", "R", "T", "Y", "U", "I", "O", "P"];
    List<String> secondRow = ["Q", "S", "D", "F", "G", "H", "J", "K", "L", "M"];
    List<String> thirdRow = ["W", "X", "C", "V", "B", "N"];
    return BlocBuilder<WordleBloc, WordleState>(
      builder: (context, state) {
        if (state is WordleLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WordleLoadedState) {
          Set<Letter?> letters = state.guesses
            .expand((element) => element.letters)
            .where((element) => element != null)
            .toSet();
          return FittedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...firstRow.map(
                      (letter) =>
                      CustomKeyWidget(
                        evaluation: letters,
                        text: letter,
                        onTap: () {
                          addLetter(letter, state, context);
                        })
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...secondRow.map(
                      (letter) =>
                      CustomKeyWidget(
                        evaluation: letters,
                        text: letter,
                        onTap: () {
                          addLetter(letter, state, context);
                        })
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...thirdRow.map(
                      (letter) =>
                      CustomKeyWidget(
                        evaluation: letters,
                        text: letter,
                        onTap: () {
                          addLetter(letter, state, context);
                        })
                    ),
                    Container(
                      width: 90,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: MyShapes.circularBorders,
                        color: Colors.transparent,
                        boxShadow: MyStyles.shadow
                      ),
                      margin: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {
                          removeLetter(state, context);
                        },
                        child: Center(
                          child: Text(
                            'Back',
                            style: MyStyles.textStyle
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
  void addLetter(String letter, WordleLoadedState state, BuildContext context){
    int wordIndex = (state.letterCount/5).floor();
    int letterIndex = (state.letterCount%5);
    List<Letter?> letters = state.guesses[wordIndex].letters;

    letters[letterIndex] = Letter(
        id: state.letterCount,
        letter: letter,
        evaluation: Evaluation.pending
    );

    Word updatedWord = state.guesses[wordIndex].copyWith(letters: letters);

    context.read<WordleBloc>().add(UpdateGuessEvent(word: updatedWord, isBackArrow: false));
  }

  void removeLetter(WordleLoadedState state, BuildContext context){
    if (state.letterCount % 5 != 0) {
      int wordIndex = (state.letterCount/5).floor();
      int letterIndex = (state.letterCount-1)%5;
      List<Letter?> letters = state.guesses[wordIndex].letters;
      letters.removeAt(letterIndex);
      letters.add(null);
      Word updatedWord = state.guesses[wordIndex]
          .copyWith(letters: letters);
      context.read<WordleBloc>().add(UpdateGuessEvent(word: updatedWord, isBackArrow: true));
    }
  }
}
