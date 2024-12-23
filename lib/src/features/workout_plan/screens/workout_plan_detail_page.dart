import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/plan/model/my_plan.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:fit_master/src/features/plan/viewmodel/my_plan_viemodel.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/workout_plan_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../plan/model/exercise.dart';

class WorkoutPlanDetailPage extends StatefulWidget {
  final int id;
  const WorkoutPlanDetailPage({
    super.key,
    required this.id,
  });

  @override
  WorkoutPlanDetailPageState createState() => WorkoutPlanDetailPageState();
}

class WorkoutPlanDetailPageState extends State<WorkoutPlanDetailPage> {
  late WorkoutPlanDetailViewmodel _viewModel;
  late MyPlanViewModel _myPlanViewModel;
  late MyPlan? _myPlan;

  @override
  void initState() {
    _viewModel =
        Provider.of<WorkoutPlanDetailViewmodel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchWorkoutDetailById(widget.id);
      _viewModel.checkHavePlan();
    });

    _myPlanViewModel = Provider.of<MyPlanViewModel>(context, listen: false);
    _myPlan = _myPlanViewModel.myPlan;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _myPlanViewModel.fetchMyPlan();
      _myPlan = _myPlanViewModel.myPlan;
    });

    logger.d("WorkoutPlanDetailPageState: ${widget.id}");

    super.initState();
  }

  _chooseThisPlan() {
    _viewModel.checkHavePlan();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_viewModel.isHavePlan) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm'),
              content: const Text(
                  'You already have a plan. Do you want to replace it with this one?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // context.pop();
                    context.goNamed('home');
                    _viewModel.chooseThisPlan(
                        _viewModel.workoutPlanDetail?.planId ?? 0);
                  },
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
        );
      } else {
        _viewModel.chooseThisPlan(_viewModel.workoutPlanDetail?.planId ?? 0);
        context.goNamed('home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<WorkoutPlanDetailViewmodel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return child ?? const SizedBox();
        }

        List<WorkoutDay>? workoutDays = model.workoutPlanDetail?.workoutDay;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(LucideIcons.chevron_left),
              onPressed: () => context.pop(),
            ),
            title: Text(
              "Chi tiết lộ trình",
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            backgroundColor: colorScheme.surface,
            iconTheme: IconThemeData(color: colorScheme.onSurface),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 9 / 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                          model.workoutPlanDetail?.coverImage ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: Text(
                      model.workoutPlanDetail?.planName ?? "",
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 0),
                            color: colorScheme.outlineVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    children: [
                      Text(
                        model.workoutPlanDetail?.planDescription ?? "",
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About The Program",
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(LucideIcons.goal, size: 28),
                                    const SizedBox(width: 12),
                                    Text(
                                        '${model.workoutPlanDetail?.workoutSummary.fitnessGoal.name}',
                                        style: textTheme.bodyMedium)
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(LucideIcons.dumbbell, size: 28),
                                    const SizedBox(width: 12),
                                    Text(
                                      '${model.workoutPlanDetail?.workoutSummary.workoutType.name}',
                                      style: textTheme.bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(LucideIcons.chevrons_up,
                                        size: 28),
                                    const SizedBox(width: 12),
                                    Text(
                                      '${model.workoutPlanDetail?.workoutSummary.trainingLevel.name}',
                                      style: textTheme.bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(LucideIcons.calendar_days,
                                        size: 28),
                                    const SizedBox(width: 12),
                                    Text(
                                      '${model.workoutPlanDetail?.workoutSummary.programDuration} Tuần',
                                      style: textTheme.bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(LucideIcons.clock, size: 28),
                                    const SizedBox(width: 12),
                                    Text(
                                      '${model.workoutPlanDetail?.workoutSummary.timePerWorkout} Phút / buổi',
                                      style: textTheme.bodyMedium,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "Program Detail",
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                if (workoutDays != null)
                                  for (WorkoutDay workoutDay in workoutDays)
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              workoutDay.workoutDayName,
                                              softWrap: true,
                                              style:
                                                  textTheme.bodyLarge?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ))
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Table(
                                          columnWidths: const {
                                            0: FlexColumnWidth(4),
                                            1: FlexColumnWidth(1),
                                            2: FlexColumnWidth(1),
                                          },
                                          children: [
                                            TableRow(children: [
                                              Text(
                                                "Bài tập",
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Sets",
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Reps",
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ]),
                                            for (Exercise exercise
                                                in workoutDay.exercises)
                                              TableRow(
                                                children: [
                                                  Text(
                                                    exercise.name,
                                                    style: textTheme.bodyMedium
                                                        ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      exercise.sets.toString(),
                                                      style: textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      exercise.reps.join(", "),
                                                      style: textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Divider(),
                                      ],
                                    ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: _myPlan?.workoutPlan.planId ==
                                      _viewModel.workoutPlanDetail?.planId
                                  ? null
                                  : () => _chooseThisPlan(),
                              child: Text(_myPlan?.workoutPlan.planId ==
                                      _viewModel.workoutPlanDetail?.planId
                                  ? "Đã chọn lộ trình này"
                                  : "Chọn lộ trình này"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
