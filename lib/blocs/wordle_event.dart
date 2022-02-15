part of 'wordle_bloc.dart';

@immutable
abstract class WordleEvent extends Equatable{
  const WordleEvent();

  @override
  List<Object> get props => [];
}

class LoadGameEvent extends WordleEvent {
}

class UpdateGuessEvent extends WordleEvent {
  final Word word;
  final bool isBackArrow;

  const UpdateGuessEvent({
    required this.word,
    required this.isBackArrow
  });

  @override
  List<Object> get props => [word];
}

class ValidateGuessEvent extends WordleEvent {
  final Word word;

  const ValidateGuessEvent({required this.word});

  @override
  List<Object> get props => [word];

}