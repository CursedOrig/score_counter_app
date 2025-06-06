import 'package:flutter/material.dart';
import '../res/app_res.dart';

enum ScoreboardOptionsChoice {restart, finish, cancel }

class ScoreboardOptionsDialog extends StatelessWidget {
  const ScoreboardOptionsDialog({super.key, required this.text});

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
                  Navigator.of(context).pop(ScoreboardOptionsChoice.restart);
                },
                child: Text(
                  AppTexts.restart,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style: AppBtnStyles.secondaryBtnStyle,
                onPressed: () {
                  Navigator.of(context).pop(ScoreboardOptionsChoice.finish);
                },
                child: Text(
                  AppTexts.finish,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style: AppBtnStyles.primaryBtnStyle,
                onPressed: () {
                  Navigator.of(context).pop(ScoreboardOptionsChoice.cancel);
                },
                child: Text(
                  AppTexts.cancel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
