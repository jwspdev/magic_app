import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:magic_app/src/data/models/playing_card.dart';

part 'magic_algorithm_event.dart';
part 'magic_algorithm_state.dart';

class MagicAlgorithmBloc
    extends Bloc<MagicAlgorithmEvent, MagicAlgorithmState> {
  int round = 0;
  List<PlayingCard> playingCards = [];
  // List<PlayingCard> randomizedCards = [];
  Map<int, List<PlayingCard>> threePiledCard = {};

  MagicAlgorithmBloc() : super(MagicAlgorithmInitial()) {
    playingCards = _generateListOfCards();
    on<MagicAlgorithmEvent>((event, emit) {});
    on<ShuffleCardsEvent>(_onShuffleCards);
    on<SelectPileOfCardsEvent>(_onSelectPileOfCards);
  }

  void _onShuffleCards(
      ShuffleCardsEvent event, Emitter<MagicAlgorithmState> emit) async {
    round = 0;
    threePiledCard = createThreePiles();
    emit(ThreePiledState(round: round, threePiledCard: threePiledCard));
  }

  void _onSelectPileOfCards(
      SelectPileOfCardsEvent event, Emitter<MagicAlgorithmState> emit) {
    var currentIndex = event.index;
    var pileInTheMiddleMap = placeSelectedPileInTheMiddle(currentIndex);
    playingCards = generateListFromMap(pileInTheMiddleMap);
    threePiledCard = createThreePilesFromScratch(playingCards);
    round++;
    debugPrint('ROUND: $round');

    emit(ThreePiledState(round: round, threePiledCard: threePiledCard));
    if (round == 3) {
      emit(CardRevealedState(selectedCard: playingCards[10]));
    }
  }

  List<PlayingCard> generateListFromMap(
      Map<int, List<PlayingCard>> mappedCard) {
    List<PlayingCard> listOfCards = [];
    mappedCard.forEach((key, value) {
      for (var val in value) {
        listOfCards.add(val);
      }
    });
    return listOfCards;
  }

  Map<int, List<PlayingCard>> placeSelectedPileInTheMiddle(int selectedPile) {
    Map<int, List<PlayingCard>> newCards = {};
    int count = 1;
    int middleIndex = 2;
    var currentPile = threePiledCard.remove(selectedPile);
    threePiledCard.forEach((key, value) {
      if (count == middleIndex) {
        newCards.addAll({count: currentPile!});
        count++;
      }
      newCards.addAll({count: value});
      count++;
    });

    return newCards;
  }

  Map<int, List<PlayingCard>> createThreePilesFromScratch(
      List<PlayingCard> playingCards) {
    Map<int, List<PlayingCard>> mappedCard = {};
    int pileCount = 1;

    for (var card in playingCards) {
      mappedCard.putIfAbsent(pileCount, () => []);
      mappedCard[pileCount]!.add(card);

      pileCount = (pileCount % 3) + 1;
    }

    return mappedCard;
  }

  Map<int, List<PlayingCard>> createThreePiles() {
    Map<int, List<PlayingCard>> mappedCard = {};
    int pileCount = 1;

    List<PlayingCard> randomizedCards = randomizeCards(21);

    for (var card in randomizedCards) {
      mappedCard.putIfAbsent(pileCount, () => []);
      mappedCard[pileCount]!.add(card);

      pileCount = (pileCount % 3) + 1;
    }

    return mappedCard;
  }

  List<PlayingCard> randomizeCards(int totalCount) {
    List<PlayingCard> randomizedCards = [];

    var rng = Random();

    int i = 1;
    while (i <= totalCount) {
      var randomNumber = rng.nextInt(playingCards.length);
      var tempCard = playingCards[randomNumber];
      if (!randomizedCards.contains(tempCard)) {
        randomizedCards.add(tempCard);
      } else {
        totalCount++;
      }
      i++;
    }
    return randomizedCards;
  }

  List<PlayingCard> _generateListOfCards() {
    List<PlayingCard> generatedListOfCards = [];

    List<String> suit = ['spade', 'clover', 'heart', 'diamond'];
    List<String> values = [
      'A',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      'J',
      'Q',
      'K',
    ];
    for (var type in suit) {
      for (var value in values) {
        generatedListOfCards.add(PlayingCard(value, type));
      }
    }

    return generatedListOfCards;
  }
}
