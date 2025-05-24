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
    return AlertDialog(
      backgroundColor: const Color(0xFF1C1B2D),
      // Тёмный фон как в твоем UI
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          Text(AppTexts.setTheDuration,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(AppTexts.chooseValue,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              )),
        ],
      ),
      content: Container(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Minutes picker
            Expanded(
              child: CupertinoPicker(
                backgroundColor: Color(0xFF1C1B2D),
                itemExtent: 32,
                scrollController: FixedExtentScrollController(
                    initialItem: widget.initialDuration.inMinutes),
                onSelectedItemChanged: (int value) {
                  _newMinutes = value;
                },
                children: List<Widget>.generate(
                    61,
                    (index) => Center(
                          child: Text(index.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Orbitron')),
                        )),
              ),
            ),
            // Seconds picker
            Expanded(
              child: CupertinoPicker(
                backgroundColor: Color(0xFF1C1B2D),
                itemExtent: 32,
                scrollController:
                    FixedExtentScrollController(initialItem: _newSeconds),
                onSelectedItemChanged: (int value) {
                  _newSeconds = value;
                },
                children: List<Widget>.generate(
                    60,
                    (index) => Center(
                          child: Text(index.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Orbitron')),
                        )),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Закрыть диалог
          },
          child:
              const Text("Cancel", style: TextStyle(color: Colors.greenAccent)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(Duration(minutes: _newMinutes, seconds: _newSeconds));
          },
          child: const Text("Save", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
