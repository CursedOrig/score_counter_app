import 'package:hive/hive.dart';

part 'history_saves.g.dart';

@HiveType(typeId: 0)
class HistorySaves {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String teamName1;

  @HiveField(2)
  String teamName2;

  @HiveField(3)
  int teamScore1;

  @HiveField(4)
  int teamScore2;

  HistorySaves({
    required this.dateTime,
    required this.teamName1, 
    required this.teamName2,
    required this.teamScore1,
    required this.teamScore2,
  });
}