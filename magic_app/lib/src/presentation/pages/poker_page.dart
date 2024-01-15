import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_app/src/presentation/bloc/magic_algorithm_bloc.dart';
import 'package:magic_app/src/presentation/widgets/custom_button.dart';
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
            SizedBox(
              height: 80,
            ),
            Center(
              child: CustomButton(
                  text: 'Again?',
                  onPressed: () {
                    context.read<MagicAlgorithmBloc>().add(ShuffleCardsEvent());
                  }),
            ),
            Text(
                'STATE: $state Your Card is: ${state.selectedCard.type} ${state.selectedCard.value}')
          ]),
        );
      }
      return const Text('error!');
    });
  }
}
