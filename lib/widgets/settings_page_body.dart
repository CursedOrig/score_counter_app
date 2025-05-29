import 'package:flutter/material.dart';
import 'package:game_score_counter/privacy_policy_page.dart';
import 'package:game_score_counter/res/app_res.dart';
import 'package:game_score_counter/terms_of_use_page.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'App settings',
            style: AppTypo.body3.copyWith(color: AppColors.textSecondary),
          ),
        ),
        SizedBox(height: 4),
        _SettingsListItem(
          title: 'Scoreboard palette',
          onTap: () {},
        ),
        SizedBox(
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Text(
            'General settings',
            style: AppTypo.body3.copyWith(color: AppColors.textSecondary),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Privacy policy',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PrivacyPolicyPage(),
              ),
            );
          },
        ),
        SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Terms of use',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TermsOfUsePage(),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Text(
            'More',
            style: AppTypo.body3.copyWith(color: AppColors.textSecondary),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Rate this app',
          onTap: () {},
        ),
        SizedBox(
          height: 4,
        ),
        _SettingsListItem(
          title: 'Share this app',
          onTap: () {},
        ),
        SizedBox(
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
