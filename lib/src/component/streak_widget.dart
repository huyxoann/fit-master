import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StreakWidget extends StatelessWidget {
  final int streak;

  const StreakWidget({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SvgPicture.asset('assets/images/icon/streak.svg'),
          Text('$streak'),
        ],
      ),
    );
  }
}
