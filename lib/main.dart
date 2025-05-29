import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_score_counter/preloader_page.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/multi_icon.dart';
import 'package:game_score_counter/widgets/my_test_multi_icon.dart';

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
        home: const PreloaderPage(),
        // home: Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       MyIcon(
        //         iconAsset: AppIcons.icPlay,
        //         isBorderEnabled: true,
        //         onTap: () {},
        //       ),
        //       MultiIcon(
        //         asset: AppIcons.icHistory,
        //         isBorderEnabled: false,
        //       ),
        //     ],
        //   ),
        // ),
        debugShowCheckedModeBanner: false);
  }
}
