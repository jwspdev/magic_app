// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magic_app/src/data/models/playing_card.dart';
import 'package:magic_app/src/presentation/bloc/magic_algorithm_bloc.dart';
import 'package:magic_app/src/presentation/widgets/card_container.dart';
import 'package:magic_app/src/presentation/widgets/custom_button.dart';
import 'package:magic_app/src/presentation/widgets/playing_card_ui.dart';

class PokerTable extends StatelessWidget {
  final Map<int, List<PlayingCard>> mappedCard;
  final int round;

  const PokerTable({
    Key? key,
    required this.mappedCard,
    required this.round,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var magicAlgoBloc = context.read<MagicAlgorithmBloc>();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CustomButton(
                  text: round > 0 ? 'Restart' : 'Shuffle',
                  onPressed: () {
                    magicAlgoBloc.add(ShuffleCardsEvent());
                  }),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                itemCount: mappedCard.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  int key = mappedCard.keys.elementAt(index);
                  return Container(
                      margin: EdgeInsets.all(8),
                      child: CardContainer(
                        cardList: mappedCard[key]!,
                        pileIndex: key,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
