import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:fit_master/src/features/plan/viewmodel/doing_exercise_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DoingExercisePage extends StatefulWidget {
  final WorkoutDay todayWorkout;

  const DoingExercisePage({super.key, required this.todayWorkout});
  @override
  _DoingExercisePageState createState() => _DoingExercisePageState();
}

class _DoingExercisePageState extends State<DoingExercisePage> {
  late DoingExerciseViewModel _viewmodel;
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    _viewmodel = Provider.of<DoingExerciseViewModel>(context, listen: false);
    _viewmodel.generateSteps(widget.todayWorkout);
    logger.d('Today workout: ${widget.todayWorkout}');
    imageUrl =
        'https://www.marbosport.eu/data/gfx/pictures/large/2/0/28502_1.jpg';
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<DoingExerciseViewModel>(
      builder: (context, value, child) {
        if (value.steps.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double screenHeight = constraints.maxHeight;
                return Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: StepProgressIndicator(
                        totalSteps: value.steps.length,
                        currentStep: value.currentStep + 1,
                        size: screenHeight * 0.005,
                        padding: 0,
                        selectedColor: colorScheme.primary,
                        unselectedColor: colorScheme.surfaceDim,
                        roundedEdges: Radius.circular(screenHeight * 0.02),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(LucideIcons.x),
                            onPressed: () {
                              showLeaveConfirm(context);
                            },
                            color: colorScheme.onSurface,
                          ),
                          Row(
                            children: [
                              Consumer<DoingExerciseViewModel>(
                                builder: (context, value, child) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          'Steps: ${value.currentStep + 1}/${value.steps.length}'),
                                      Text(
                                          '${(value.elapsedSeconds ~/ 60).toString().padLeft(2, '0')}:${(value.elapsedSeconds % 60).toString().padLeft(2, '0')}'),
                                    ],
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(LucideIcons.music),
                                color: colorScheme.onSurface,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Container(
                        width: screenWidth,
                        height: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer<DoingExerciseViewModel>(
                                builder: (context, value, child) {
                                  return Text(
                                    value.steps[value.currentStep].title,
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    LucideIcons.message_circle_question),
                              )
                            ],
                          ),
                          Consumer<DoingExerciseViewModel>(
                            builder: (context, value, child) {
                              if (value.steps[value.currentStep].type ==
                                  StepType.rest) {
                                if (value.restSeconds <= 0) {
                                  value.incrementStep(context);
                                }
                                return Text(
                                  '${value.restSeconds ~/ 60}:${(value.restSeconds % 60).toString().padLeft(2, '0')}',
                                  style: textTheme.headlineLarge?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              if (value.steps[value.currentStep].type ==
                                  StepType.cooldown) {
                                if (value.restSeconds <= 0) {
                                  value.incrementStep(context);
                                }
                                return Text(
                                  '${value.restSeconds ~/ 60}:${(value.restSeconds % 60).toString().padLeft(2, '0')}',
                                  style: textTheme.headlineLarge?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              return Text(
                                'x ${value.steps[value.currentStep].reps.toString()}',
                                style: textTheme.headlineLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Consumer<DoingExerciseViewModel>(
                                  builder: (context, value, child) {
                                    if (value.currentStep == 0) {
                                      return const IconButton(
                                        onPressed: null,
                                        icon: Icon(LucideIcons.skip_back),
                                      );
                                    }
                                    return IconButton(
                                      onPressed: () {
                                        _viewmodel.decrementStep();
                                      },
                                      icon: const Icon(LucideIcons.skip_back),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    _viewmodel.incrementStep(context);
                                  },
                                  child: const Icon(LucideIcons.check),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    _viewmodel.incrementStep(context);
                                  },
                                  icon: const Icon(LucideIcons.skip_forward),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showLeaveConfirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text(
              'Do you want to exit? All exercises you have done will not save.'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                context.pop();
                context.pop();
              },
              child: const Text('Leave'),
            ),
          ],
        );
      },
    );
  }
}
