import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/res/shadows.dart';
import 'package:game_score_counter/widgets/focusable_text_field.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
    required this.color,
    required this.text,
    required this.onDecrease,
    required this.onIncrease, required this.score, required this.onTextChanged,
  });

  final Color color;
  final String text;
  final int score;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final void Function(String) onTextChanged;

    @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          FocusableTextField(
            initialText: text, onTextChanged: onTextChanged,
          ),
          const Spacer(flex: 1),
          Text(
            score.toString(),
            style: AppTypo.headerSpecial.copyWith(color: AppColors.background)
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: score > 0
                    ? onDecrease
                    : null,
                child: Container(
                  width: 72,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    boxShadow: Shadows.mainShadow,
                    color: AppColors.background,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: 1.5,
                      child: SvgPicture.asset(
                        AppIcons.icMinus,
                        width: 24,
                        height: 24,
                        color: score > 0
                            ? AppColors.textPrimary
                            : AppColors.gray1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: onIncrease,
                child: Container(
                  width: 72,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    boxShadow: Shadows.mainShadow,
                    color: AppColors.background,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: 1.5,
                      child: SvgPicture.asset(
                        AppIcons.icPlus,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
