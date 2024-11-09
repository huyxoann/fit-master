import 'package:fit_master/src/core/models/enum.dart';
import 'package:flutter/material.dart';

class GenderSelectionCard extends StatelessWidget {
  final Gender gender;
  final bool isSelected;

  const GenderSelectionCard({
    super.key,
    required this.gender,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(gender == Gender.Male
              ? 'assets/images/icon/male.png'
              : 'assets/images/icon/female.png'),
          Text(
            gender == Gender.Male ? "Nam" : "Nữ",
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
