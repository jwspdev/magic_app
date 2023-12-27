
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:magic_app/features/twentyOneCardFeature/data/datasources/local/card_dao.dart';
import 'package:magic_app/features/twentyOneCardFeature/domain/entities/playing_card.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
// import 'package:path/path.dart';

part 'app_database.g.dart';
@Database(version: 1, entities: [PlayingCard])
abstract class AppDataBase extends FloorDatabase{
  CardDao get cardDao;
}