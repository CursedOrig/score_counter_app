import 'package:flutter/material.dart';
import 'package:game_score_counter/score_provider.dart';
import 'package:game_score_counter/widgets/team_widget.dart';
import 'package:game_score_counter/widgets/timer_widget.dart';
import 'package:provider/provider.dart';

class MainGameScoreArea extends StatelessWidget {
  const MainGameScoreArea({
    super.key,
    required this.selectedPalette,
  });

  final List<Color> selectedPalette;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScoreProvider>(context);

    return Stack(
      children: [
        Flex(
          direction: MediaQuery.of(context).orientation == Orientation.portrait
              ? Axis.vertical
              : Axis.horizontal,
          children: [
            Expanded(
              child: TeamWidget(
                color: selectedPalette[0],
                text: 'Team 1',
                onDecrease: provider.onDecrease1,
                onIncrease: provider.onIncrease1,
                score: provider.score1,
              ),
            ),
            Expanded(
              child: TeamWidget(
                color: selectedPalette[1],
                text: 'Team 2',
                onDecrease: provider.onDecrease2,
                onIncrease: provider.onIncrease2,
                score: provider.score2,
              ),
            )
          ],
        ),
        Center(
          child: TimerWidget(
            onRefresh: () {
              // setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
