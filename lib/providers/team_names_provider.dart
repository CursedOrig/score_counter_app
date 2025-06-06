import 'package:flutter/material.dart';

class TeamNamesProvider with ChangeNotifier {
  String _teamName1 = 'Team 1';

  String get teamName1 => _teamName1;

  String _teamName2 = 'Team 2';

  String get teamName2 => _teamName2;

  void changeTeamName1(String newValue){
    _teamName1 = newValue;
  }

  void changeTeamName2(String newValue){
    _teamName2 = newValue;
  }
}
