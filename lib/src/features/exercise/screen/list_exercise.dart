import 'package:fit_master/src/core/constants/app_info.dart';
import 'package:fit_master/src/core/exception/response/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../commom_widgets/header.dart';
import '../../../core/models/enum.dart';
import '../view_model/exercise.view_model.dart';
import 'widgets/filter.dart';

class ListExerciseScreen extends StatefulWidget {
  const ListExerciseScreen({super.key});

  @override
  State<ListExerciseScreen> createState() => _ListExerciseScreenState();
}

class _ListExerciseScreenState extends State<ListExerciseScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch exercises when the screen is initialized
    Future.microtask(() {
      final viewModel = Provider.of<ExerciseViewModel>(context, listen: false);
      viewModel.fetchExercises();
    });
  }

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var widthScreen = AppInfo.getScreenWidth(context);

    return Container(
      color: colorTheme.background,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                HeaderApp(),
                const SizedBox(height: 16),

                // Experience level filter
                Consumer<ExerciseViewModel>(
                  builder: (context, viewModel, _) {
                    return ExperienceFilterWidget(
                      label: "Kinh nghiệm",
                      options: ExperienceLevel.values.map((e) => e.vietnameseName).toList(),
                      onSelected: (value) {
                        // Update experience level in view model
                        final selectedLevel = ExperienceLevel.values.firstWhere((e) => e.vietnameseName == value);
                        viewModel.setExperienceLevel(selectedLevel.index);
                      },
                    );
                  },
                ),

                const SizedBox(height: 8),

                // Target muscle filter
                Consumer<ExerciseViewModel>(
                  builder: (context, viewModel, _) {
                    return ExperienceFilterWidget(
                      label: "Các loại bài tập",
                      options: TargetMuscle.values.map((e) => e.vietnameseName).toList(),
                      onSelected: (value) {
                        // Update target muscle in view model
                        final selectedMuscle = TargetMuscle.values.firstWhere((e) => e.vietnameseName == value);
                        viewModel.setTargetMuscle(selectedMuscle.index);
                      },
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Display exercises or loading/error state
                Expanded(
                  child: Consumer<ExerciseViewModel>(
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
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Set the number of columns
                            crossAxisSpacing: 16, // Horizontal space between items
                            mainAxisSpacing: 16, // Vertical space between items
                            childAspectRatio: 0.75, // Aspect ratio of each item (width/height)
                          ),
                          itemCount: exercises.exercises.length,
                          itemBuilder: (context, index) {
                            final data = exercises.exercises[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Using FadeInImage for image loading with placeholder
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(12), // Apply border radius
                                    child: SizedBox(
                                      
                                      height: 160,
                                      width: widthScreen * 0.44,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/images/placeholder.png', // placeholder image
                                        image: data.coverImage,
                                        fit: BoxFit.cover,
                                        fadeInDuration: const Duration(milliseconds: 300),
                                        fadeOutDuration: const Duration(milliseconds: 300),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data.title,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    overflow: TextOverflow.ellipsis, // Prevent text overflow
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink(); // Fallback empty widget
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
