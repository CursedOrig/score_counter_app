import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/widgets/settings_app_bar.dart';
import 'package:game_score_counter/widgets/settings_page_body.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.dispose();
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
          child: const Column(
            children: [
              SettingsAppBar(
                title: 'Settings',
                hasActions: true,
              ),
              SizedBox(height: 10,),
              SettingsPageBody(),
            ],
          )),
    );
  }
}
