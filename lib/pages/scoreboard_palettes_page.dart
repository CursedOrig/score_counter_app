import 'package:flutter/material.dart';
import 'package:game_score_counter/res/palettes.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/shared_prefs_ext/extensions.dart';
import 'package:game_score_counter/widgets/settings_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScoreboardPalettePage extends StatefulWidget {
  @override
  _ScoreboardPalettePageState createState() => _ScoreboardPalettePageState();
}

class _ScoreboardPalettePageState extends State<ScoreboardPalettePage> {
  final PageController _controller = PageController();

  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        selectedPage = _controller.page?.round() ?? 0;
      });
    });
  }

  Future<void> _saveSelectedPaletteIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(PrefsExt.paletteKey, index);
  }

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
            SettingsAppBar(title: AppTexts.scoreboardPalette, hasActions: false),
            const Spacer(flex: 5),
            Expanded(
              flex: 100,
              child: PageView.builder(
                controller: _controller,
                itemCount: Palettes.palettes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 0.88,
                            child:
                                Container(color: Palettes.palettes[index][0]),
                          ),
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 0.88,
                            child:
                                Container(color: Palettes.palettes[index][1]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Spacer(flex: 3),
            SmoothPageIndicator(
              controller: _controller,
              count: Palettes.palettes.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primary1,
                dotColor: AppColors.greenTertiary,
              ),
            ),
            const Spacer(flex: 10),
            TextButton(
              onPressed: () async {
                await _saveSelectedPaletteIndex(selectedPage);
                Navigator.pop(context, true);
              },
              style: AppBtnStyles.primaryBtnStyle,
              child: Text(
                'Confirm selection',
                style: AppTypo.headerS,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom - 20),
          ],
        ),
      ),
    );
  }
}
