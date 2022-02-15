import 'package:equatable/equatable.dart';
import 'package:wordle/models/letter_model.dart';

class Word extends Equatable {
  final int? id;
  final List<Letter?> letters;

  const Word({
    this.id,
    required this.letters
  });

  @override
  List<Object?> get props => [id,letters];

  Word copyWith({
    int? id,
    List<Letter?>? letters
  }) {
    return Word(
      id: id ?? this.id,
      letters: letters ?? this.letters
    );
  }
}