import 'package:game_score_counter/data/model/history_saves.dart';
import 'package:hive/hive.dart';

class HistorySavesRepo {
  static final HistorySavesRepo _singleton = HistorySavesRepo._internal();

  factory HistorySavesRepo() => _singleton;

  HistorySavesRepo._internal() {
    Hive.registerAdapter(HistorySavesAdapter());
  }

  static const _name = 'HistorySavesAdapterKey';

  Future<List<HistorySaves>> getAll() async {
    final box = await Hive.openBox<HistorySaves>(_name);
    return box.values.toList();
  }

  Future<void> delete(HistorySaves b7) async {
    final box = await Hive.openBox<HistorySaves>(_name);
    await box.delete(b7.dateTime.toString());
  }

  Future add(HistorySaves b7) async {
    final box = await Hive.openBox<HistorySaves>(_name);
    await box.put(b7.dateTime.toString(), b7);
  }
}