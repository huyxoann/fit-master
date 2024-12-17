import 'dart:async';

import 'package:fit_master/src/features/plan/model/step.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoingExerciseViewModel extends ChangeNotifier {
  List<StepExercise> _steps = [];
  List<StepExercise> get steps => _steps;
  int _currentStep = 0;
  int get currentStep => _currentStep;

  Timer? _timer;
  int _elapsedSeconds = 0;
  int get elapsedSeconds => _elapsedSeconds;

  void generateSteps(WorkoutDay workoutDay) {
    List<StepExercise> steps = [];
    workoutDay.exercises.forEach((exercise) {
      for (int i = 0; i < exercise.sets; i++) {
        steps.add(
          StepExercise(
            title: exercise.name,
            reps: exercise.reps[i] ?? exercise.reps.last,
          ),
        );
      }
    });
    _steps = steps;

    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedSeconds++;
      notifyListeners();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void incrementStep(BuildContext context) {
    if (_currentStep < _steps.length - 1) {
      _currentStep++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } else {
      _stopTimer();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushNamed('plan_complete');
      });
    }
  }

  void decrementStep() {
    if (_currentStep > 0) {
      _currentStep--;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  void resetStep() {
    _currentStep = 0;
    _elapsedSeconds = 0;
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void checkAndNavigate(BuildContext context) {
    if (_currentStep >= _steps.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pushNamed('plan_complete');
      });
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
