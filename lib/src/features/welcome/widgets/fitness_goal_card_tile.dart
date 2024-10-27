import 'package:fit_master/core/enum/fitness_goal_enum.dart';
import 'package:flutter/material.dart';

class FitnessGoalCardTile extends StatelessWidget {
  final String title;
  final FitnessGoalEnum fitnessGoal;

  const FitnessGoalCardTile(
      {super.key, required this.title, required this.fitnessGoal});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
