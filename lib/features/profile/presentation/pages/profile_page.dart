import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/profile/presentation/user_info.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const UserInfo(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2,
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: kPadding * 4,
                  ),
                  _ProfileAction(
                    title: 'Profile Scores',
                    icon: Icons.bar_chart_sharp,
                    onTap: () => DjangoflowAppSnackbar.showInfo('Coming soon'),
                    subtitle: 'View your Green score, rewards etc',
                  ),
                  const SizedBox(
                    height: kPadding * 4,
                  ),
                  _ProfileAction(
                    title: 'Edit Profile',
                    icon: Icons.person_outlined,
                    onTap: () => DjangoflowAppSnackbar.showInfo('Coming soon'),
                    subtitle: 'Modify Subscription, Personal details etc',
                  ),
                  const SizedBox(
                    height: kPadding * 4,
                  ),
                  _ProfileAction(
                    title: 'Groups',
                    icon: Icons.group,
                    onTap: () => DjangoflowAppSnackbar.showInfo('Coming soon'),
                    subtitle: 'Create Group, add/remove members etc',
                  ),
                  const SizedBox(
                    height: kPadding * 4,
                  ),
                  _ProfileAction(
                    title: 'Settings',
                    icon: Icons.app_settings_alt,
                    onTap: () => DjangoflowAppSnackbar.showInfo('Coming soon'),
                    subtitle: 'App preferences',
                  ),
                ],
              ),
            ),
          )
        ],
      );
}

class _ProfileAction extends StatelessWidget {
  const _ProfileAction({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.subtitle,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String subtitle;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(subtitle),
        onTap: onTap,
      );
}
