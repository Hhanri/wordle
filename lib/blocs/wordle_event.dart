part of 'wordle_bloc.dart';

@immutable
abstract class WordleEvent extends Equatable{
  const WordleEvent();

  @override
  List<Object> get props => [];
}

class LoadGameEvent extends WordleEvent {
  final Word solution;

  const LoadGameEvent({required this.solution});

  @override
  List<Object> get props => [solution];
}

class UpdateGuessEvent extends WordleEvent {
  final Word word;
  bool? isBackArrow = false;

  UpdateGuessEvent({
    required this.word,
    this.isBackArrow
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