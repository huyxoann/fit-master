import 'dart:convert';

import 'package:fit_master/src/commom_widgets/header_back.dart';
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
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                context.goNamed('login');
                Provider.of<SettingViewmodel>(context, listen: false).logout();
              },
              child: Text('Logout'),
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
          appBar: FitnessAppBar(streak: 0),
          body: Column(
            children: [
              ListTile(
                leading: Icon(LucideIcons.circle_user_round),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Workout Perference'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () => _showLogoutConfirmation(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
