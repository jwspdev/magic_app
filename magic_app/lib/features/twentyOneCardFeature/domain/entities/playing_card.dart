import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

enum CardSuit{
  cloves,
  spade,
  heart,
  diamond,
}

enum CardNumber{
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
}

enum CardColor{
  red,
  black,
}

@Entity(tableName: "cardDeckTable")
class PlayingCard extends Equatable{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final CardSuit cardSuit;  
  final CardNumber cardNumber;
  final bool isOpen;
  final bool isFaceUp;

  const PlayingCard(
    this.id, 
    {required this.cardSuit, 
    required this.cardNumber, 
    this.isOpen = false, 
    this.isFaceUp = false,
  });

  CardColor get cardColor {
    if(cardSuit == CardSuit.heart|| cardSuit == CardSuit.diamond){
      return CardColor.red;
    }else{
      return CardColor.black;
    }
  }

  @override
  List<Object?> get props => [
    cardSuit,
    cardNumber,
    isOpen,
    isFaceUp,
    cardColor,
  ];
}