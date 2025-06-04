import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_score_counter/data/history_saves_repo.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/settings_app_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.background,
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: 20,
          top: 20 + MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            SettingsAppBar(title: AppTexts.history, hasActions: false),
            Expanded(
                child: FutureBuilder(
                  future: HistorySavesRepo().getAll(),
                  builder: (context, snap) {
                    return snap.data == null ? const CupertinoActivityIndicator() : ListView.builder(
                      itemCount: snap.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: AppColors.layer1,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(width: 2, color: AppColors.layer2)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Text(
                                  '16 JAN 2024 12:00',
                                  style: AppTypo.caption2,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.layer2,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${snap.data?[index].teamName1}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTypo.body2,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '333 - 2',
                                        style: AppTypo.headerM
                                            .copyWith(color: AppColors.primary1),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Team 2',
                                          style: AppTypo.body2,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
