import 'package:fit_master/src/core/models/trophy_state_enum.dart';
import 'package:fit_master/src/features/plan/model/workout_history.dart';
import 'package:fit_master/src/features/workout_plan/widgets/cup_wigdet.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WeekScheduleWidget extends StatelessWidget {
  final int startDay;
  final int planTotalCount;
  final int currentStep;
  final List<WorkoutHistory> workoutHistories;
  const WeekScheduleWidget({
    super.key,
    required this.planTotalCount,
    required this.currentStep,
    required this.startDay,
    required this.workoutHistories,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mục tiêu tuần',
                style: textTheme.titleSmall,
              ),
              Text(
                '${workoutHistories.map((e) => e.date.day > startDay).length}/$currentStep',
                style: textTheme.titleSmall,
              ),
            ],
          ),
          const SizedBox(width: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildCup,
          ),
          const SizedBox(width: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tiến độ',
                style: textTheme.titleSmall,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StepProgressIndicator(
                  totalSteps: planTotalCount,
                  currentStep: workoutHistories.length,
                  selectedColor: colorScheme.primary,
                  unselectedColor: colorScheme.surfaceContainerHighest,
                  size: 12,
                  padding: 0,
                  roundedEdges: const Radius.circular(12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> get _buildCup {
    return [
      for (int i = 0; i < 7; i++)
        CupWidget(
            day: startDay + i,
            state: workoutHistories
                    .map((e) => e.date.day)
                    .toList()
                    .contains(startDay + i)
                ? TrophyStateEnum.completed
                : TrophyStateEnum.notCompleted),
    ];
  }
}
