import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:magic_app/utils/constants/strings.dart';

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

@Entity(tableName: StringConstants.DECK_OF_CARDS)
class PlayingCard extends Equatable{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  // todo uncomment later, add type converter
  // final CardSuit cardSuit;  
  // final CardNumber cardNumber;

  //todo remove cardSuit and cardNumber
  final String cardSuit;
  final String cardNumber;
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
    if(cardSuit == CardSuit.heart.name|| cardSuit == CardSuit.diamond.name){
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