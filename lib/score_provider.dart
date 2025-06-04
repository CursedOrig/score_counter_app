import 'package:flutter/widgets.dart';

class ScoreProvider with ChangeNotifier {
  int _score1 = 0;

  int get score1 => _score1;

  int _score2 = 0;

  int get score2 => _score2;

  void onDecrease1() {
    _score1--;
    notifyListeners();
  }

  void onIncrease1() {
    _score1++;
    notifyListeners();
  }

  void onDecrease2() {
    _score2--;
    notifyListeners();
  }

  void onIncrease2() {
    _score2++;
    notifyListeners();
  }
}
