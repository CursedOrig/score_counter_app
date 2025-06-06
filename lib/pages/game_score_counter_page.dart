import 'package:flutter/material.dart';
import 'package:game_score_counter/res/palettes.dart';
import 'package:game_score_counter/providers/score_provider.dart';
import 'package:game_score_counter/shared_prefs_ext/extensions.dart';
import 'package:game_score_counter/widgets/main_game_score_area.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScoreCounterPage extends StatefulWidget {
  const GameScoreCounterPage({super.key});

  @override
  State<GameScoreCounterPage> createState() => _GameScoreCounterPageState();
}

class _GameScoreCounterPageState extends State<GameScoreCounterPage> {
  late List<Color> selectedPalette = [Colors.black, Colors.black];
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    _loadPalette();
  }

  Future<void> _loadPalette() async {
    prefs = await SharedPreferences.getInstance();
    final index = prefs?.getInt(PrefsExt.paletteKey) ?? 0;
    setState(() {
      selectedPalette = Palettes.palettes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final index = prefs?.getInt(PrefsExt.paletteKey) ?? 0;
    selectedPalette = Palettes.palettes[index];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScoreProvider>(create: (_) => ScoreProvider()),
      ],
      child: Column(
        children: [
          /// Colored top safe area
          Container(
            height: MediaQuery.of(context).padding.top,
            color: selectedPalette[0],
          ),
          Expanded(
            child: MainGameScoreArea(selectedPalette: selectedPalette),
          ),

          /// Colored bottom safe area
          Container(
            height: MediaQuery.of(context).padding.top,
            color: selectedPalette[1],
          ),
        ],
      ),
    );
  }
}


