import 'package:hive/hive.dart';
import 'models/history_model.dart';

class HistoryRepo {
  static final HistoryRepo _singleton = HistoryRepo._internal();

  factory HistoryRepo() => _singleton;

  HistoryRepo._internal() {
    Hive.registerAdapter(HistoryModelAdapter());
  }

  static const _name = 'HistorySavesAdapterKey';

  Future<List<HistoryModel>> getAll() async {
    final box = await Hive.openBox<HistoryModel>(_name);
    return box.values.toList();
  }

  Future<void> delete(HistoryModel delModel) async {
    final box = await Hive.openBox<HistoryModel>(_name);
    await box.delete(delModel.dateTime.toString());
  }

  Future add(HistoryModel newModel) async {
    final box = await Hive.openBox<HistoryModel>(_name);
    await box.put(newModel.dateTime.toString(), newModel);
  }
}
