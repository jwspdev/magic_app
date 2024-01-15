part of 'magic_algorithm_bloc.dart';

sealed class MagicAlgorithmEvent {}

class ShuffleCardsEvent extends MagicAlgorithmEvent {}

class SelectPileOfCardsEvent extends MagicAlgorithmEvent {
  int index;
  SelectPileOfCardsEvent(this.index);
}

class ResetDeckCardsEvent extends MagicAlgorithmEvent {}
