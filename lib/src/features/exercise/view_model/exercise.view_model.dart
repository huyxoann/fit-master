import 'package:fit_master/src/features/exercise/repositories/exercise.repo.dart';
import 'package:flutter/foundation.dart';
import 'package:fit_master/src/features/exercise/data/res/res.exercise.dart';
import '../../../core/exception/response/api_response.dart';

class ExerciseViewModel extends ChangeNotifier {
  final ExerciseRepository _exerciseRepository;
    ExerciseViewModel(this._exerciseRepository);

  // Update ApiResponse to expect a single GetListExerciseResponse
  ApiResponse<GetListExerciseResponse> _exercises = ApiResponse.loading();
  ApiResponse<GetListExerciseResponse> get exercises => _exercises;

 // Default selected filter values
  int _experienceLevel = 1;
  int _targetMuscle = 1;
  int _offset = 0;

  int get experienceLevel => _experienceLevel;
  int get targetMuscle => _targetMuscle;
  int get offset => _offset;

  // Setters to update filter values and fetch exercises
  void setExperienceLevel(int level) {
    _experienceLevel = level+1;
    fetchExercises();
  }

  void setTargetMuscle(int muscle) {
    _targetMuscle = muscle+1;
    fetchExercises();
  }

  void setOffset(int newOffset) {
    _offset = newOffset;
    fetchExercises();
  }

  // Private method to fetch exercises based on current filter values
  Future<void> fetchExercises() async {
    _exercises = ApiResponse.loading();
    notifyListeners();
    print("danng kay dât ở viewwmdoel");
    try {
      final response = await _exerciseRepository.fetchExercises(
        experienceLevel: _experienceLevel,
        targetMuscle: _targetMuscle,
        offset: _offset,
      );
        print("lay thanh cong ${response.exercises.length}");
      _exercises = ApiResponse.completed(response);
    
    } catch (e) {
      _exercises = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }
}
