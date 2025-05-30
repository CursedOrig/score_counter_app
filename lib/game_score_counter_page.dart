import 'package:flutter/material.dart';
import 'package:game_score_counter/palettes.dart';
import 'package:game_score_counter/shared_prefs_ext/extensions.dart';
import 'package:game_score_counter/widgets/team_widget.dart';
import 'package:game_score_counter/widgets/timer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScoreCounterPage extends StatefulWidget {
  const GameScoreCounterPage({super.key});

  @override
  State<GameScoreCounterPage> createState() => _GameScoreCounterPageState();
}

class _GameScoreCounterPageState extends State<GameScoreCounterPage> {
  late List<Color> selectedPalette = [Colors.black, Colors.black];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadPalette();
  }

  Future<void> _loadPalette() async {
    prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(PrefsExt.paletteKey) ?? 0;
    setState(() {
      selectedPalette = Palettes.palettes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final index = prefs.getInt(PrefsExt.paletteKey) ?? 0;
    selectedPalette = Palettes.palettes[index];

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: selectedPalette[0],
        ),
        Expanded(
          child: Stack(
            children: [
              Flex(
                direction:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? Axis.vertical
                        : Axis.horizontal,
                children: [
                  Expanded(
                    child: TeamWidget(
                      color: selectedPalette[0],
                      text: 'Team 1',
                    ),
                  ),
                  Expanded(
                    child: TeamWidget(
                      color: selectedPalette[1],
                      text: 'Team 2',
                    ),
                  )
                ],
              ),
              Center(child: TimerWidget(
                onRefresh: () {
                  setState(() {});
                },
              )),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.top,
          color: selectedPalette[1],
        ),
      ],
    );
  }
}
