import 'package:fit_master/src/component/appbar.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/workout_plan.viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/widgets/week_schedule_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WorkoutDashBoard extends StatefulWidget {
  const WorkoutDashBoard({super.key});

  @override
  WorkoutDashBoardState createState() => WorkoutDashBoardState();
}

class WorkoutDashBoardState extends State<WorkoutDashBoard> {
  late WorkoutPlanViewModel _viewModel;
  @override
  void initState() {
    _viewModel = Provider.of<WorkoutPlanViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchWorkoutPlanDetail('', 0.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<WorkoutPlanViewModel>(
        builder: (_, model, child) {
          if (model.isLoading) {
            return child ?? const SizedBox();
          }
          return Scaffold(
            appBar: const FitnessAppBar(
              streak: 5,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm...',
                        prefixIcon: const Icon(LucideIcons.search),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceBright,
                      ),
                    ),
                    WeekScheduleWidget(
                      startDay: DateTime.now().day,
                      currentStep: 3,
                      planTotalCount: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lộ trình của bạn",
                          style: textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
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
                                    image: AssetImage(
                                        model.workoutPlanDetail?.coverImage ??
                                            ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: double.infinity,
                                height:
                                    (MediaQuery.of(context).size.width - 32) *
                                        9 /
                                        16,
                              ),
                              const SizedBox(width: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      model.workoutPlanDetail?.planName ?? '',
                                      style: textTheme.bodyMedium,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(LucideIcons.clock),
                                      Text(
                                          '${model.workoutPlanDetail?.workoutSummary.programDuration} Tuần')
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bài tập được đề xuất",
                          style: textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        child: const Center(child: CircularProgressIndicator()));
  }
}
