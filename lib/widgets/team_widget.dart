import 'package:flutter/material.dart';
import 'package:game_score_counter/res/shadows.dart';
import 'package:game_score_counter/widgets/focusable_text_field.dart';

import '../res/app_res.dart';

class TeamWidget extends StatefulWidget {
  final Color color;
  final String text;

  const TeamWidget({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  TeamWidgetState createState() => TeamWidgetState();
}

class TeamWidgetState extends State<TeamWidget> {
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FocusableTextField(
            initialText: widget.text,
          ),
          const SizedBox(height: 20),
          Text(
            '$_score',
            style: const TextStyle(fontSize: 120, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _score > 0
                    ? () {
                        setState(() {
                          _score--;
                        });
                      }
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
                    child: Icon(
                      Icons.remove,
                      color:
                          _score > 0 ? AppColors.textPrimary : AppColors.gray1,
                    ),
                  )),
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    _score++;
                  });
                },
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
                      child:
                          const Icon(Icons.add, color: AppColors.textPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
