import 'package:flutter/material.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/team_widget.dart';
import 'package:game_score_counter/widgets/timer_widget.dart';

class GameScoreCounterPage extends StatefulWidget {
  const GameScoreCounterPage({super.key});

  @override
  State<GameScoreCounterPage> createState() => _GameScoreCounterPageState();
}

class _GameScoreCounterPageState extends State<GameScoreCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: AppColors.yellowPalette1,
        ),
        Expanded(
          child: Stack(
            children: [
              Flex(
                direction:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? Axis.vertical
                        : Axis.horizontal,
                children: const [
                  Expanded(
                    child: TeamWidget(
                      color: AppColors.yellowPalette1,
                      text: 'Team 1',
                    ),
                  ),
                  Expanded(
                    child: TeamWidget(
                      color: AppColors.purplePalette1,
                      text: 'Team 2',
                    ),
                  )
                ],
              ),
              const Center(child: TimerWidget()),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.top,
          color: AppColors.purplePalette1,
        ),
      ],
    );
  }
}
