import 'package:fit_master/src/features/welcome/viewmodel/workout_recommend_viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class WorkoutRecommendScreen extends StatefulWidget {
  const WorkoutRecommendScreen({super.key});

  @override
  _WorkoutRecommendScreenState createState() => _WorkoutRecommendScreenState();
}

class _WorkoutRecommendScreenState extends State<WorkoutRecommendScreen> {
  late WorkoutRecommendViewmodel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<WorkoutRecommendViewmodel>(context, listen: false);

    var box = Hive.box('userDataBox');
    int gender = box.get('gender');
    int fitnessGoal = box.get('fitnessGoal');
    int yearOfBirth = box.get('yearOfBirth');
    int age = DateTime.now().year - yearOfBirth;
    double height = box.get('height');
    double weight = box.get('weight');
    double bmi = weight / (height / 100 * height / 100);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchRecommendedWorkoutPlan(gender, fitnessGoal, age, bmi);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<WorkoutRecommendViewmodel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (model.recommendedWorkoutPlan == null) {
          return const Center(child: Text('No workout plan available.'));
        }
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: colorScheme.surface,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(LucideIcons.chevron_left),
                  color: colorScheme.onSurface,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  "Recommended Workout Plan",
                  style: textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(4.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: StepProgressIndicator(
                      totalSteps: 5,
                      roundedEdges: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  Flexible(
                    child: WorkoutCard(model: model.recommendedWorkoutPlan),
                  ),
                ],
              )),
        );
      },
    );
  }
}
