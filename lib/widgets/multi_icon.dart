import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../res/app_res.dart';

class MultiIcon extends StatelessWidget {
  const MultiIcon({
    super.key,
    required this.isBorderEnabled,
    required this.asset, this.onTap,
  });

  final String asset;
  final bool isBorderEnabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(
          isBorderEnabled ? AppColors.background : Colors.transparent,
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (states) => CircleBorder(
            side: BorderSide(
              width: isBorderEnabled ? 2 : 0,
              color: !isBorderEnabled
                  ? Colors.transparent
                  : switch (states.current) {
                      BtnState.active => AppColors.primary1,
                      BtnState.pressed => AppColors.primary2,
                      BtnState.disabled => AppColors.gray2,
                    },
            ),
          ),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(56, 56)),
        foregroundBuilder: (_, states, ___) => SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
              switch (states.current) {
                BtnState.active => AppColors.primary1,
                BtnState.pressed => AppColors.primary2,
                BtnState.disabled => AppColors.gray2,
              },
              BlendMode.srcIn),
        ),
      ),
      child: const SizedBox(),
    );
  }
}

extension on Set<WidgetState> {
  BtnState get current {
    if (contains(WidgetState.pressed)) {
      return BtnState.pressed;
    }
    if (contains(WidgetState.disabled)) {
      return BtnState.disabled;
    }
    return BtnState.active;
  }
}

enum BtnState { active, pressed, disabled }
