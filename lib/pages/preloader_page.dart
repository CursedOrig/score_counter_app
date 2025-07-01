import 'package:flutter/material.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/pages/welcome_page.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game_score_counter_page.dart';

class PreloaderPage extends StatefulWidget {
  const PreloaderPage({super.key});

  @override
  State<PreloaderPage> createState() => _PreloaderPageState();
}

class _PreloaderPageState extends State<PreloaderPage> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    await Future.delayed(const Duration(milliseconds: 200));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            isFirstTime ? const WelcomePage() : const GameScoreCounterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Center(
                child: SizedBox(
                  height: 39,
                  width: 39,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: [AppColors.primary1],
                    strokeWidth: 2.76,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
