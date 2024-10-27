import 'package:fit_master/core/enum/gender_enum.dart';
import 'package:flutter/material.dart';

class GenderSelectionCard extends StatelessWidget {
  final GenderEnum gender;
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
          Image.asset(gender == GenderEnum.Male
              ? 'assets/images/icon/male.png'
              : 'assets/images/icon/female.png'),
          Text(
            gender == GenderEnum.Male ? "Nam" : "Nữ",
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
