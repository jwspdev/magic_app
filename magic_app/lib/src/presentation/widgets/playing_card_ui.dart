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
      height: 64,
      width: 64,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: Icon(_buildIcon()),
            ),
            SizedBox(
              height: 8,
            ),
            Text('$value')
          ],
        ),
      ),
    );
  }

  _buildIcon() {
    switch (suit) {
      case 'diamond':
        return CupertinoIcons.suit_diamond;
      case 'clover':
        return CupertinoIcons.suit_club;
      case 'spade':
        return CupertinoIcons.suit_spade;
      case 'heart':
        return CupertinoIcons.suit_heart;
    }
  }
}
