
import 'package:fit_master/src/component/appbar.dart';
import 'package:fit_master/src/features/options/viewmodel/setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                context.goNamed('login');
                Provider.of<SettingViewmodel>(context, listen: false).logout();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingViewmodel>(
      builder: (_, model, child) {
        return Scaffold(
          appBar: const FitnessAppBar(streak: 0),
          body: Column(
            children: [
              ListTile(
                leading: const Icon(LucideIcons.circle_user_round),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Workout Perference'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () => _showLogoutConfirmation(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
