import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_app/src/presentation/bloc/magic_algorithm_bloc.dart';
import 'package:magic_app/src/presentation/pages/poker_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => MagicAlgorithmBloc(),
          child: const Center(child: PokerPage()),
        ),
      ),
    );
  }
}
