// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magic_app/src/data/models/playing_card.dart';
import 'package:magic_app/src/presentation/bloc/magic_algorithm_bloc.dart';
import 'package:magic_app/src/presentation/widgets/playing_card_ui.dart';

class CardContainer extends StatelessWidget {
  final int pileIndex;
  final List<PlayingCard> cardList;
  const CardContainer({
    Key? key,
    required this.pileIndex,
    required this.cardList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var magicAlgoBloc = context.read<MagicAlgorithmBloc>();
    return GestureDetector(
      onTap: () {
        magicAlgoBloc.add(SelectPileOfCardsEvent(pileIndex));
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 219, 184, 61), width: 4),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _setListOfCards(),
        ),
      ),
    );
  }

  Widget _setListOfCards() {
    List<Widget> listOfCards = [];

    for (int i = 0; i < cardList.length; i++) {
      Widget tempWidget = Positioned(
        top: (i * 10),
        left: (i * 40),
        child: Container(
          width: 70,
          padding: const EdgeInsets.all(4),
          child: PlayingCardUi(
            suit: cardList[i].type,
            value: cardList[i].value,
          ),
        ),
      );
      listOfCards.add(tempWidget);
    }
    return Stack(
      children: listOfCards,
    );
  }
}

/**
 * Stack(
            children: [
              Container(
                height: 300,
                width: 400,
                color: Colors.blue,
              ),
              Positioned(
                top: 20,
                left: 40,
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.red,
                ),
              ),
              Positioned(
                top: 40,
                left: 80,
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.green,
                ),
              ),
            ],
          ),
 * 
 */