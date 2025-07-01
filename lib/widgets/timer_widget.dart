import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_score_counter/data/history_repo.dart';
import 'package:game_score_counter/providers/team_names_provider.dart';
import 'package:game_score_counter/widgets/multi_icon.dart';
import 'package:game_score_counter/dialogs/scoreboard_options_dialog.dart';
import 'package:game_score_counter/dialogs/time_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../data/models/history_model.dart';
import '../dialogs/scoreboard_time_over_dialog.dart';
import '../interaction/vibration_manager.dart';
import '../res/app_res.dart';
import '../providers/score_provider.dart';
import '../pages/settings_page.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    this.initialDuration = const Duration(minutes: 1),
    required this.onRefresh,
  });

  final Duration initialDuration;
  final VoidCallback onRefresh;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Duration _remainingTime;
  late Duration _userSelectedTime;
  Timer? _timer;
  bool _isRunning = false;

  String get _formattedRemainingTime => _formatTime(_remainingTime);

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialDuration;
    _userSelectedTime = widget.initialDuration;
  }

  Future<void> _showTimePickerDialog(BuildContext context) async {
    final Duration? result = await showDialog<Duration>(
      context: context,
      builder: (BuildContext context) {
        return MyTimePickerDialog(
          initialDuration: _remainingTime,
        );
      },
    );
    if (result != null) {
      print('result = $result');
      setState(() {
        _remainingTime = result;
        _userSelectedTime = result;
      });
    }
  }

  Future<void> _showScoreBoardOptionsDialog(
    BuildContext context,
    String text,
  ) async {
    _pauseTimer();
    final choice = await showDialog<ScoreboardOptionsChoice>(
      context: context,
      builder: (BuildContext context) {
        return ScoreboardOptionsDialog(text: text);
      },
    );

    if (!context.mounted) return;

    switch (choice) {
      case ScoreboardOptionsChoice.restart:
        _remainingTime = _userSelectedTime;
        _startTimer();
        _pauseTimer();
      case ScoreboardOptionsChoice.finish:
        final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
        final nameProvider =
            Provider.of<TeamNamesProvider>(context, listen: false);
        final savedScore = HistoryModel(
          dateTime: DateTime.now(),
          teamName1: nameProvider.teamName1,
          teamName2: nameProvider.teamName2,
          teamScore1: scoreProvider.score1,
          teamScore2: scoreProvider.score2,
        );
        await HistoryRepo().add(savedScore);
        scoreProvider.setInitial();
        setState(() {
          _remainingTime = widget.initialDuration;
          _remainingTime = widget.initialDuration;
        });
      default:
        {}
    }
  }

  Future<void> _showScoreBoardTimeOverDialog(
    BuildContext context,
    String text,
  ) async {
    _pauseTimer();
    final choice = await showDialog<ScoreboardTimeOverChoice>(
      context: context,
      builder: (BuildContext context) {
        return ScoreboardTimeOverDialog(text: text);
      },
    );

    if (!context.mounted) return;

    switch (choice) {
      case ScoreboardTimeOverChoice.restart:
        _remainingTime = _userSelectedTime;
        _startTimer();
        _pauseTimer();
      case ScoreboardTimeOverChoice.finish:
        final provider = Provider.of<ScoreProvider>(context, listen: false);
        final nameProvider =
            Provider.of<TeamNamesProvider>(context, listen: false);
        final savedScore = HistoryModel(
          dateTime: DateTime.now(),
          teamName1: nameProvider.teamName1,
          teamName2: nameProvider.teamName2,
          teamScore1: provider.score1,
          teamScore2: provider.score2,
        );
        await HistoryRepo().add(savedScore);
        _remainingTime = widget.initialDuration;
        _startTimer();
        _pauseTimer();
      case ScoreboardTimeOverChoice.repeat:
        final provider = Provider.of<ScoreProvider>(context, listen: false);
        final nameProvider =
            Provider.of<TeamNamesProvider>(context, listen: false);
        final savedScore = HistoryModel(
          dateTime: DateTime.now(),
          teamName1: nameProvider.teamName1,
          teamName2: nameProvider.teamName2,
          teamScore1: provider.score1,
          teamScore2: provider.score2,
        );
        await HistoryRepo().add(savedScore);
        _remainingTime = _userSelectedTime;
        _startTimer();
        _pauseTimer();
      default:
        {}
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime -= const Duration(seconds: 1);
      });
      print('time = ${_remainingTime.inSeconds}');
      if (_remainingTime.inSeconds == 0) {
        _stopTimer();
      } else {}
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _stopTimer() async {
    _timer?.cancel();

    _showScoreBoardTimeOverDialog(context, 'Time is over');

    final prefs = await SharedPreferences.getInstance();
    final isVibrationEnabled =
        prefs.getBool(VibrationManager.vibrationKey) ?? false;
    if (isVibrationEnabled) {
      await Vibration.vibrate();
    }

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _isRunning = false;
      _remainingTime = _userSelectedTime;
    });
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)}';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MultiIcon(
            asset: _isRunning ? AppIcons.icClose : AppIcons.icSettings,
            isBorderEnabled: true,
            onTap: _isRunning
                ? () {
                    _showScoreBoardOptionsDialog(context, 'Select option');
                  }
                : () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                    widget.onRefresh.call();
                  },
          ),
          const SizedBox(width: 6),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width * 0.50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: AppDeco.timerDeco,
            child: InkWell(
              onTap: () => _showTimePickerDialog(context),
              child: Text(
                _formattedRemainingTime,
                style: AppTypo.headerXL32.copyWith(color: AppColors.primary1),
              ),
            ),
          ),
          const SizedBox(width: 6),
          MultiIcon(
            asset: _isRunning ? AppIcons.icPause : AppIcons.icPlay,
            isBorderEnabled: true,
            onTap: () {
              if (_isRunning) {
                _pauseTimer();
              } else {
                _startTimer();
              }
            },
          ),
        ],
      ),
    );
  }
}
