
import 'package:fit_master/src/features/exercise/data/res/res.exercise.dart';
import 'package:fit_master/src/features/exercise/data/res/res.exercise_detail.dart';

abstract class ExerciseRepository {
  Future<GetListExerciseResponse> fetchExercises({
    required int experienceLevel,
    required int targetMuscle,
    required int offset,
    String? token,
  });

   Future<ExerciseDetailResponse> fetchExerciseDetail({
    required int exerciseId,
    String? token,
  });
}
