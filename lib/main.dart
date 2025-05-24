import 'package:flutter/material.dart';
import 'package:game_score_counter/game_score_counter_page.dart';
import 'package:game_score_counter/res/app_res.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppTheme.tuneSystemUiDark();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Orbitron',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GameScoreCounterPage(),
        debugShowCheckedModeBanner: false);
  }
}
