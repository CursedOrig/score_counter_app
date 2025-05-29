import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_score_counter/main.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/multi_icon.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const SettingsAppBar({
    super.key,
    required this.title, required this.hasActions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 361,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MultiIcon(asset: AppIcons.icBack, isBorderEnabled: false, onTap: () {
                    Navigator.of(context).pop();
                  },),
                  Text(
                    title,
                    style: AppTypo.headerL,
                  ),
                  hasActions ? SvgPicture.asset(AppIcons.icHistory) : SizedBox(width: 44,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
