import 'package:flutter/material.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/settings_app_bar.dart';

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SettingsAppBar(
        title: 'Terms of use',
        hasActions: false,
      ),
      body: SingleChildScrollView(
        child: Text(
          AppTexts.lorem,
          style: AppTypo.body3.copyWith(color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
