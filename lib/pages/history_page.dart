import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_score_counter/data/history_repo.dart';
import 'package:game_score_counter/data/models/history_model.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/settings_app_bar.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const paddings = EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    );

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
                future: HistoryRepo().getAll(),
                builder: (context, snapp) {

                  /// Give us List<HistoryModel>
                  List<HistoryModel> invertedList = [];
                  if (snapp.data != null) {
                    invertedList.addAll(snapp.data!.reversed);
                  }

                  return snapp.data == null
                      ? const CupertinoActivityIndicator()
                      : ListView.builder(
                          itemCount: invertedList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final formatter = DateFormat('dd MMM yyyy HH:mm');
                            String formattedDate = formatter
                                .format(invertedList[index].dateTime)
                                .toUpperCase();

                            /// uses only one HistoryModel from List
                            return Dismissible(
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.all(16),
                                decoration: AppDeco.historyDeletingItemDeco,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      CupertinoIcons.trash_fill,
                                      color: AppColors.background,
                                      size: 32,
                                    ),
                                    Text('Delete',
                                        style: AppTypo.body1.copyWith(
                                            color: AppColors.background))
                                  ],
                                ),
                              ),
                              key: Key(invertedList[index].dateTime.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                HistoryRepo().delete(invertedList[index]);
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: AppDeco.historyOuterItemDeco,
                                child: Column(
                                  children: [
                                    /// Item title
                                    Padding(
                                      padding: paddings,
                                      child: Text(
                                        formattedDate,
                                        style: AppTypo.caption2,
                                      ),
                                    ),

                                    /// Item score area
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: AppDeco.historyInnerItemDeco,
                                      child: Padding(
                                        padding: paddings,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: _buildTeamName(
                                                invertedList[index].teamName1,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              '${invertedList[index].teamScore1} - ${invertedList[index].teamScore2}',
                                              style: AppTypo.headerM.copyWith(
                                                  color: AppColors.primary1),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: _buildTeamName(
                                                invertedList[index].teamName2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildTeamName(String name) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTypo.body2,
      textAlign: TextAlign.right,
    );
  }
}
