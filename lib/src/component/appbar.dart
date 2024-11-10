import 'package:fit_master/src/component/streak_widget.dart';
import 'package:flutter/material.dart';

class FitnessAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int streak;
  const FitnessAppBar({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      leading: Container(
        color: colorScheme.background,
        margin: const EdgeInsets.only(left: 16.0),
        child: Image.asset('assets/images/logo/fitmaster_logo.png'),
      ),
      actions: <Widget>[StreakWidget(streak: streak)],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
