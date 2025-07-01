import 'package:flutter/material.dart';
import '../res/app_res.dart';

enum ScoreboardTimeOverChoice {restart, finish, repeat }

class ScoreboardTimeOverDialog extends StatelessWidget {
  const ScoreboardTimeOverDialog({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(20),
          decoration: AppDeco.dialogDeco,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTypo.headerL,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppTexts.selectOption,
                style: AppTypo.body3,
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style: AppBtnStyles.secondaryBtnStyle,
                onPressed: () {
                  Navigator.of(context).pop(ScoreboardTimeOverChoice.repeat);
                },
                child: Text(
                  AppTexts.repeat,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style: AppBtnStyles.secondaryBtnStyle,
                onPressed: () {
                  Navigator.of(context).pop(ScoreboardTimeOverChoice.restart);
                },
                child: Text(
                  AppTexts.restart,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style: AppBtnStyles.primaryBtnStyle,
                onPressed: () {
                  Navigator.of(context).pop(ScoreboardTimeOverChoice.finish);
                },
                child: Text(
                  AppTexts.finish,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
