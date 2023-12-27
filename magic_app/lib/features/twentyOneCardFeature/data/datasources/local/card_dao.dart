
import 'package:floor/floor.dart';
import 'package:magic_app/features/twentyOneCardFeature/domain/entities/playing_card.dart';
import '../../../../../utils/constants/strings.dart';
@dao
abstract class CardDao{

  @Query('SELECT * FROM ${StringConstants.DECK_OF_CARDS}')
  Future<List<PlayingCard>> getAllCards();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMultipleCards(List<PlayingCard> playingCards);
}