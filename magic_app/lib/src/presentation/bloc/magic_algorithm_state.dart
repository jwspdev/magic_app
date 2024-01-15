// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'magic_algorithm_bloc.dart';

sealed class MagicAlgorithmState extends Equatable {}

class MagicAlgorithmInitial extends MagicAlgorithmState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ThreePiledState extends MagicAlgorithmState {
  int round;
  Map<int, List<PlayingCard>> threePiledCard;

  ThreePiledState({
    required this.round,
    required this.threePiledCard,
  });

  @override
  List<Object?> get props => [round, threePiledCard];
}

class CardRevealedState extends MagicAlgorithmState {
  PlayingCard selectedCard;
  CardRevealedState({required this.selectedCard});

  @override
  List<Object?> get props => [selectedCard];
}
// class MagicAlgorithmSelectPileState extends MagicAlgorithmState {
//   int round;
  

//   @override
//   List<Object?> get props => throw UnimplementedError();
// }
