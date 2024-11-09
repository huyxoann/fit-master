import 'package:fit_master/src/core/models/trophy_state_enum.dart';
import 'package:fit_master/src/features/workout_plan/widgets/cup_wigdet.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WeekScheduleWidget extends StatelessWidget {
  final int startDay;
  final int planTotalCount;
  final int currentStep;
  const WeekScheduleWidget(
      {super.key,
      required this.planTotalCount,
      required this.currentStep,
      required this.startDay});

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
                '1/3',
                style: textTheme.titleSmall,
              ),
            ],
          ),
          const SizedBox(width: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CupWidget(day: startDay, state: TrophyStateEnum.completed),
              CupWidget(day: startDay + 1, state: TrophyStateEnum.completed),
              CupWidget(day: startDay + 2, state: TrophyStateEnum.notCompleted),
              CupWidget(day: startDay + 3, state: TrophyStateEnum.completed),
              CupWidget(day: startDay + 4, state: TrophyStateEnum.completed),
              CupWidget(day: startDay + 5, state: TrophyStateEnum.today),
              CupWidget(day: startDay + 6, state: TrophyStateEnum.completed),
            ],
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
                  currentStep: currentStep,
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
}
