import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/app_res.dart';

class MyTimePickerDialog extends StatefulWidget {
  const MyTimePickerDialog({super.key, required this.initialDuration});

  final Duration initialDuration;

  @override
  State<MyTimePickerDialog> createState() => _MyTimePickerDialogState();
}

class _MyTimePickerDialogState extends State<MyTimePickerDialog> {
  var _newMinutes = 0;
  var _newSeconds = 0;

  @override
  void initState() {
    _newMinutes = widget.initialDuration.inMinutes;
    _newSeconds = widget.initialDuration.inSeconds;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              AppTexts.setTheDuration,
              style: AppTypo.headerL,
            ),
            const SizedBox(height: 8),
            Text(AppTexts.chooseValue, style: AppTypo.body3),
            const SizedBox(height: 12),
            SizedBox(
              width: 114,
              height: 189,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Minutes picker
                  Expanded(
                    child: CupertinoPicker(
                      looping: true,
                      backgroundColor: Colors.transparent,
                      itemExtent: 36,
                      offAxisFraction: -0.7,
                      scrollController: FixedExtentScrollController(
                          initialItem: widget.initialDuration.inMinutes),
                      onSelectedItemChanged: (int value) {
                        _newMinutes = value;
                      },
                      children: List<Widget>.generate(
                          61,
                          (index) => Center(
                                child: Text(index.toString().padLeft(2, '0'),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Orbitron')),
                              )),
                    ),
                  ),
                  // Seconds picker
                  Expanded(
                    child: CupertinoPicker(
                      looping: true,
                      backgroundColor: Colors.transparent,
                      itemExtent: 32,
                      offAxisFraction: 0.7,
                      scrollController:
                          FixedExtentScrollController(initialItem: _newSeconds),
                      onSelectedItemChanged: (int value) {
                        _newSeconds = value;
                      },
                      children: List<Widget>.generate(
                        60,
                        (index) => Center(
                          child: Text(index.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'Orbitron')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              style: AppBtnStyles.primaryBtnStyle,
              onPressed: () {
                Navigator.of(context)
                    .pop(Duration(minutes: _newMinutes, seconds: _newSeconds));
              },
              child: const Text("Save"),
            ),
            const SizedBox(height: 12),
            TextButton(
              style:  AppBtnStyles.secondaryBtnStyle,
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалог
              },
              child: const Text(
                "Cancel",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
