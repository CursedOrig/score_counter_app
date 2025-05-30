import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_score_counter/widgets/multi_icon.dart';
import 'package:game_score_counter/widgets/time_picker_dialog.dart';

import '../res/app_res.dart';
import '../settings_page.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    this.initialDuration = const Duration(minutes: 1), required this.onRefresh,
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
      setState(() {
        _remainingTime = result;
        _userSelectedTime = result;
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds == 0) {
        _stopTimer();
      } else {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      }
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

  void _stopTimer() {
    _timer?.cancel();
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
                ? null
                : () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                    widget.onRefresh.call();
                  },
          ),
          const SizedBox(width: 6),
          Container(
            height: 56,
            width: 164,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: AppDeco.timerDeco,
            child: InkWell(
              onTap: () => _showTimePickerDialog(context),
              child: Text(
                _formattedRemainingTime,
                style: AppTypo.headerXL32.copyWith(color: AppColors.primary1),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
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
