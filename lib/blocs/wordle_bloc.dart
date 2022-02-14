import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wordle_event.dart';
part 'wordle_state.dart';

class WordleBloc extends Bloc<WordleEvent, WordleState> {
  WordleBloc() : super(WordleInitial()) {
    on<WordleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
