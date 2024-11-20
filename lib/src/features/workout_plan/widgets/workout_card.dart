import 'package:fit_master/src/features/workout_plan/models/workout_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutPlan? model;

  const WorkoutCard({super.key, this.model});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.pushNamed(
        'workout-plan-detail',
        pathParameters: {'id': '1'},
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(model?.coverImage ?? ""),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: (MediaQuery.of(context).size.width - 32) * 9 / 16,
          ),
          const SizedBox(width: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  model?.planName ?? "",
                  style: textTheme.bodyMedium,
                ),
              ),
              Row(
                children: [
                  const Icon(LucideIcons.clock),
                  Text('${model?.workoutSummary.programDuration} Tuần')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
