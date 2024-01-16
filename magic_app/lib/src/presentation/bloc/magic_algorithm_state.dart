// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'magic_algorithm_bloc.dart';

class MagicAlgorithmState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class MagicAlgorithmInitial extends MagicAlgorithmState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ThreePiledState extends MagicAlgorithmState {
  final int round;
  final Map<int, List<PlayingCard>> threePiledCard;

  ThreePiledState({
    required this.round,
    required this.threePiledCard,
  });

  @override
  List<Object?> get props => [round, threePiledCard];
}

class CardRevealedState extends MagicAlgorithmState {
  final PlayingCard selectedCard;
  CardRevealedState({required this.selectedCard});

  @override
  List<Object?> get props => [selectedCard];
}
