import 'package:flutter/material.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game_score_counter_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  _setFirstTimeFalseAndNavigate(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScoreCounterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/img.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppTexts.betterExperience,
                  style: AppTypo.headerL,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => _setFirstTimeFalseAndNavigate(context),
                  style: AppBtnStyles.primaryBtnStyle,
                  child: const Text('Start'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
