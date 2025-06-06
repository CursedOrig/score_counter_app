import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_score_counter/pages/history_page.dart';
import 'package:hive/hive.dart';
import '../res/app_res.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const SettingsAppBar({
    super.key,
    required this.title,
    required this.hasActions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: SvgPicture.asset(
              AppIcons.icBack,
            ),
          ),
          Text(
            title,
            style: AppTypo.headerL,
          ),
          hasActions
              ? InkWell(
                  child: SvgPicture.asset(AppIcons.icHistory),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ),
                  ),
                )
              : const SizedBox(
                  width: 44,
                ),
        ],
      ),
    );
  }
}
