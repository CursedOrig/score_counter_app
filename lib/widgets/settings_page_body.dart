import 'package:flutter/material.dart';
import 'package:game_score_counter/privacy_and_terms_page.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/scoreboard_palettes.dart';

class _SettingsListItem extends StatelessWidget {
  final String title;
  final Widget? actions;
  final GestureTapCallback onTap;

  const _SettingsListItem({
    required this.title,
    this.actions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTypo.body1.copyWith(
                color: Colors.white,
              ),
            ),
            actions ??
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primary1,
                  size: 18,
                ),
          ],
        ),
      ),
    );
  }
}

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({super.key});

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  bool _vibrationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        Text(
          'App settings',
          style: AppTypo.body3.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        _SettingsListItem(
          title: 'Scoreboard palette',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ScoreboardPalettePage(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Vibration',
          actions: Switch(
            value: _vibrationEnabled,
            onChanged: (bool value) {
              setState(() {
                _vibrationEnabled = value;
              });
            },
            activeColor: AppColors.primary1,
            inactiveTrackColor: Colors.white24,
          ),
          onTap: () {},
        ),
        const SizedBox(height: 16),
        Text(
          'General settings',
          style: AppTypo.body3.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Privacy policy',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PrivacyAndTermsPage(title: 'Privacy policy',),
              ),
            );
          },
        ),
        const SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Terms of use',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PrivacyAndTermsPage(title: 'Terms of use'),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Text(
          'More',
          style: AppTypo.body3.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Rate this app',
          onTap: () {},
        ),
        const SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Share this app',
          onTap: () {},
        ),
        const SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Clear data',
          onTap: () {},
        ),
      ],
    );
  }
}
