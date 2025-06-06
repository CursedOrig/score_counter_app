import 'package:flutter/material.dart';
import 'package:game_score_counter/providers/score_provider.dart';
import 'package:game_score_counter/providers/team_names_provider.dart';
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
    final scoreProvider = Provider.of<ScoreProvider>(context);
    final nameProvider = Provider.of<TeamNamesProvider>(context);
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
                text: nameProvider.teamName1,
                onDecrease: scoreProvider.onDecrease1,
                onIncrease: scoreProvider.onIncrease1,
                score: scoreProvider.score1, onTextChanged: nameProvider.changeTeamName1,
              ),
            ),
            Expanded(
              child: TeamWidget(
                color: selectedPalette[1],
                text: nameProvider.teamName2,
                onDecrease: scoreProvider.onDecrease2,
                onIncrease: scoreProvider.onIncrease2,
                score: scoreProvider.score2, onTextChanged: nameProvider.changeTeamName2,
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
