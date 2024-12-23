import 'package:fit_master/src/features/plan/model/workout_plan.dart';
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
        pathParameters: {'id': model?.planId.toString() ?? '0'},
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(model?.coverImage ??
                      "https://cdn.muscleandstrength.com/sites/default/files/fit-asian-man-doing-dumbbell-curl.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300 * 9 / 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      model?.planName ?? "",
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        LucideIcons.clock,
                      ),
                      Text('${model?.workoutSummary.programDuration} Weeks')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
