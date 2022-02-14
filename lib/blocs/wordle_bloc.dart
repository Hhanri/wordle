import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wordle/models/word_model.dart';

part 'wordle_event.dart';
part 'wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {
  WordleBloc() : super(WordleInitial()) {
    on<WordleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
