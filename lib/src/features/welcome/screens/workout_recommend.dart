import 'package:fit_master/src/features/workout_plan/viewmodels/workout_plan.viewmodel.dart';
import 'package:fit_master/src/features/workout_plan/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutRecommendScreen extends StatefulWidget {
  const WorkoutRecommendScreen({super.key});

  @override
  _WorkoutRecommendScreenState createState() => _WorkoutRecommendScreenState();
}

class _WorkoutRecommendScreenState extends State<WorkoutRecommendScreen> {
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
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<WorkoutPlanViewModel>(
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Đây là bài tập chúng tôi đề xuất cho bạn',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    WorkoutCard(model: model.workoutPlanDetail ?? null),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
