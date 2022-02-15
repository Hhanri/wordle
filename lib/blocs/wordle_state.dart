part of 'wordle_bloc.dart';

@immutable
abstract class WordleState extends Equatable{
  const WordleState();
  @override
  List<Object?> get props => [];
}

class WordleAppLauching extends WordleState {}

class WordleLoadingState extends WordleState {}

class WordleLoadedState extends WordleState {
  final Word solution;
  final List<String> dictionary;
  final List<Word> guesses;
  final int letterCount;
  final bool isNotInDictionary;

  const WordleLoadedState({
    required this.solution,
    required this.dictionary,
    required this.guesses,
    this.letterCount = 0,
    this.isNotInDictionary = false
  });

  @override
  List<Object?> get props => [
    solution,
    dictionary,
    guesses,
    letterCount,
    isNotInDictionary
  ];
}

class WordleSolvedState extends WordleState {}

class WordleLostState extends WordleState {}