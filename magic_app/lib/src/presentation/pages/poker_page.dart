import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_app/src/presentation/bloc/magic_algorithm_bloc.dart';
import 'package:magic_app/src/presentation/widgets/custom_button.dart';
import 'package:magic_app/src/presentation/widgets/playing_card_ui.dart';
import 'package:magic_app/src/presentation/widgets/poker_table.dart';

class PokerPage extends StatelessWidget {
  const PokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicAlgorithmBloc, MagicAlgorithmState>(
        builder: (context, state) {
      if (state is MagicAlgorithmInitial) {
        return CustomButton(
            text: 'Start',
            onPressed: () {
              context.read<MagicAlgorithmBloc>().add(ShuffleCardsEvent());
            });
      }
      if (state is ThreePiledState) {
        return PokerTable(mappedCard: state.threePiledCard, round: state.round);
      }
      if (state is CardRevealedState) {
        return Center(
          child: Column(children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: CustomButton(
                  text: 'Again?',
                  onPressed: () {
                    context.read<MagicAlgorithmBloc>().add(ShuffleCardsEvent());
                  }),
            ),
            const Text('YOUR CARD IS CHARAN'),
            Container(
              width: 100,
              height: 150,
              child: PlayingCardUi(
                  value: state.selectedCard.value,
                  suit: state.selectedCard.type),
            )
          ]),
        );
      }
      return const Text('error!');
    });
  }
}
