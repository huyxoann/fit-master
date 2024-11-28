import 'package:fit_master/src/component/appbar.dart';
import 'package:fit_master/src/core/exception/response/status.dart';
import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/exercise/screen/widgets/filter.dart';
import 'package:fit_master/src/features/exercise/view_model/exercise.view_model.dart';
import 'package:fit_master/src/features/exercise/widgets/exercise_tile.dart';
import 'package:fit_master/src/features/plan/model/workout_plan.dart';
import 'package:fit_master/src/features/workout_plan/models/workout_summary.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/dashboard_exercise_list_viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/viewmodels/workout_plan.viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/widgets/week_schedule_widget.dart';
import 'package:fit_master/src/features/workout_plan/widgets/workout_card.dart';
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
  late ExerciseViewModel _exerciseViewModel;
  late DashboardExerciseListViewmodel _dashboardExerciseListViewmodel;

  @override
  void initState() {
    _viewModel = Provider.of<WorkoutPlanViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchMyPlan();
      _viewModel.fetchListWorkoutPlan("");
    });
    _exerciseViewModel = Provider.of<ExerciseViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _exerciseViewModel.fetchExercises();
    });
    _dashboardExerciseListViewmodel =
        Provider.of<DashboardExerciseListViewmodel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dashboardExerciseListViewmodel
          .fetchExerciseWithLevel(ExperienceLevel.Beginner.index);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutPlanViewModel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return child ?? const SizedBox();
        }
        return Scaffold(
          appBar: const FitnessAppBar(streak: 5),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildSearchField(context),
                  const SizedBox(height: 16),
                  _buildWeekSchedule(),
                  const SizedBox(height: 16),
                  model.myPlan != null
                      ? _buildMyPlanSection(context, model)
                      : Container(),
                  _recommendPlan(context, model),
                  const SizedBox(height: 16),
                  _buildRecommendedExercisesSection(context),
                ],
              ),
            ),
          ),
        );
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _recommendPlan(BuildContext context, WorkoutPlanViewModel model) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lộ trình được đề xuất",
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200, // Set a fixed height
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: model.workoutPlans?.length ?? 0,
            itemBuilder: (context, index) {
              final data = model.workoutPlans?[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: WorkoutCard(model: data),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(LucideIcons.search),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceBright,
      ),
    );
  }

  Widget _buildWeekSchedule() {
    return WeekScheduleWidget(
      startDay: DateTime.now().day,
      currentStep: 3,
      planTotalCount: 10,
    );
  }

  Widget _buildMyPlanSection(BuildContext context, WorkoutPlanViewModel model) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lộ trình của bạn",
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => context.pushNamed(
            'workout-plan-detail',
            pathParameters: {'id': '${model.myPlan?.workoutPlan.planId}'},
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        model.myPlan?.workoutPlan.coverImage ?? ''),
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
                      model.myPlan?.workoutPlan.planName ?? '',
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(LucideIcons.clock),
                      Text('${model.myPlan?.workoutPlan.programDuration} Tuần')
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRecommendedExercisesSection(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bài tập được đề xuất",
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Consumer<DashboardExerciseListViewmodel>(
          builder: (context, viewModel, _) {
            return ExperienceFilterWidget(
              label: "",
              options:
                  ExperienceLevel.values.map((e) => e.vietnameseName).toList(),
              onSelected: (value) {
                final selectedLevel = ExperienceLevel.values
                    .firstWhere((e) => e.vietnameseName == value);
                viewModel.fetchExerciseWithLevel(selectedLevel.index);
              },
            );
          },
        ),
        const SizedBox(height: 16),
        Consumer<DashboardExerciseListViewmodel>(
          builder: (context, viewModel, _) {
            final exercisesState = viewModel.exercises;
            if (exercisesState.status == Status.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (exercisesState.status == Status.ERROR) {
              return Center(child: Text('Error: ${exercisesState.message}'));
            } else if (exercisesState.status == Status.COMPLETED) {
              final exercises = exercisesState.data;
              if (exercises == null || exercises.exercises.isEmpty) {
                return const Center(child: Text('No exercises found.'));
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: double.infinity,
                  mainAxisExtent: 40,
                  mainAxisSpacing: 12,
                ),
                itemCount: exercises.exercises.length,
                itemBuilder: (context, index) {
                  final data = exercises.exercises[index];
                  return ExerciseTile(
                    name: data.title,
                    coverImage: data.coverImage,
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
