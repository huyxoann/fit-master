import 'package:fit_master/src/features/exercise/data/req/req.exercise.dart';
import 'package:fit_master/src/features/exercise/data/res/res.exercise.dart';

abstract class ExerciseRepository {
  Future<GetListExerciseResponse> fetchExercises({
    required int experienceLevel,
    required int targetMuscle,
    required int offset,
    String? token,
  });
}
