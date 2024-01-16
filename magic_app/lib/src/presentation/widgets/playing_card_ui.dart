// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayingCardUi extends StatelessWidget {
  final String suit, value;
  const PlayingCardUi({
    Key? key,
    required this.value,
    required this.suit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 64,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.shade800),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     offset: const Offset(
          //       1.0,
          //       0.0,
          //     ),
          //     blurRadius: 1.0,
          //     spreadRadius: 1.0,
          //   )
          // ]
        ),
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            Positioned(
                left: _checkLeftLength(), top: -5, child: Text('$value')),
            Positioned(
              // left: 1,
              top: 15,
              child: SizedBox(
                width: 16,
                height: 16,
                child: Icon(_buildIcon()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _checkLeftLength() {
    double val = double.tryParse(value) ?? 0.0;
    if (val >= 10) {
      return 0;
    }
    return 5;
  }

  _buildIcon() {
    switch (suit) {
      case 'diamond':
        return CupertinoIcons.suit_diamond_fill;
      case 'clover':
        return CupertinoIcons.suit_club_fill;
      case 'spade':
        return CupertinoIcons.suit_spade_fill;
      case 'heart':
        return CupertinoIcons.suit_heart_fill;
    }
  }
}
