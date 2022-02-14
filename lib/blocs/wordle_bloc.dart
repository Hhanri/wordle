import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:wordle/models/word_model.dart';

part 'wordle_event.dart';
part 'wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {
  WordleBloc() : super(WordleLoadingState()) {
    on<LoadGameEvent>(_onLoadGameEvent);
    on<UpdateGuessEvent>(_onUpdateGuessEvent);
    on<ValidateGuessEvent>(_onValidateGuessEvent);
  }

  void _onLoadGameEvent(
    LoadGameEvent event,
    Emitter<WordleState> emit
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    String dictionary = await rootBundle.loadString("/dictionary.txt");

    emit(
      WordleLoadedState(
        solution: event.solution,
        dictionary: dictionary.split("\n").map((word) => word.toLowerCase()).toList(),
        guesses: Word.guesses
      )
    );
  }
  void _onUpdateGuessEvent(
    UpdateGuessEvent event,
    Emitter<WordleState> emit
  ) async {
    final state = this.state;
    if (state is WordleLoadedState) {
      int letterCount;
      switch(event.isBackArrow) {
        case true:
          letterCount = state.letterCount -1;
          break;
        default:
          letterCount = state.letterCount +1;
      }
      List<Word> guesses = (state.guesses.map((word) {
        return word.id == event.word.id ? event.word : word;
      }).toList());

      emit(
        WordleLoadedState(
          solution: state.solution,
          dictionary: state.dictionary,
          guesses: guesses,
          letterCount: letterCount
        )
      );
      if (letterCount % 5 == 0 && !event.isBackArrow) {
        if (state.dictionary.contains(
          event.word.letters
            .map((letter)=> letter!.letter)
            .join()
            .toLowerCase()
        )) {
          add(ValidateGuessEvent(word: event.word));
        } else {
          List<Word> guesses = (state.guesses.map((word) {
            return word.id == event.word.id
              ? Word(
                id: event.word.id,
                letters: List.generate(5,(index) => null)
              )
              : word;
          }).toList());
        }
      }
    }
  }

  void _onValidateGuessEvent(
    ValidateGuessEvent event,
    Emitter<WordleState> emit
  ) async {
  }
}
