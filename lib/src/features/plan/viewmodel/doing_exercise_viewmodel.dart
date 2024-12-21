import 'dart:async';

import 'package:fit_master/src/core/models/enum.dart';
import 'package:fit_master/src/features/plan/model/step.dart';
import 'package:fit_master/src/features/plan/model/workout_day.dart';
import 'package:fit_master/src/features/plan/model/workout_history.dart';
import 'package:fit_master/src/features/plan/services/workout_history_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoingExerciseViewModel extends ChangeNotifier {
  final WorkoutHistoryService _workoutHistoryService = WorkoutHistoryService();

  List<StepExercise> _steps = [];
  List<StepExercise> get steps => _steps;
  int _currentStep = 0;
  int get currentStep => _currentStep;

  Timer? _timer;
  int _elapsedSeconds = 0;
  int get elapsedSeconds => _elapsedSeconds;

  Timer? _restTimer;
  int _restSeconds = 0;
  int get restSeconds => _restSeconds;

  StepType _stepType = StepType.exercise;
  StepType get stepType => _stepType;

  void generateSteps(WorkoutDay workoutDay) {
    List<StepExercise> steps = [];
    for (var exercise in workoutDay.exercises) {
      for (int i = 0; i < exercise.sets; i++) {
        steps.add(
          StepExercise(
            title: exercise.name,
            reps: exercise.reps[i] ?? exercise.reps.last,
            type: StepType.exercise,
          ),
        );
        steps.add(
          StepExercise(
            title: 'Take a break',
            reps: 0,
            type: StepType.cooldown,
          ),
        );
      }
      steps.removeLast();
      steps.add(
        StepExercise(
          title: 'Take a rest',
          reps: 0,
          type: StepType.rest,
        ),
      );
    }
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

  void startRestTimer(int totalRestSeconds) {
    _restSeconds = totalRestSeconds;
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_restSeconds > 0) {
        _restSeconds--;
        notifyListeners();
      } else {
        stopRestTimer();
      }
    });
  }

  void stopRestTimer() {
    _restTimer?.cancel();
  }

  void resetRestTimer(int totalRestSeconds) {
    stopRestTimer();
    startRestTimer(totalRestSeconds);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void incrementStep(BuildContext context) async {
    if (_currentStep < _steps.length - 1) {
      _currentStep++;
      _stepType = _steps[_currentStep].type;
      if (_stepType == StepType.rest) {
        resetRestTimer(45);
      } else if (_stepType == StepType.cooldown) {
        resetRestTimer(15);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } else {
      _stopTimer();
      await _workoutHistoryService.addWorkoutHistory(
        WorkoutHistory(
          date: DateTime.now(),
          status: WorkoutStatusEnum.completed,
        ),
      );
      context.pushNamed('plan_complete');
    }
  }

  void decrementStep() {
    if (_currentStep > 0) {
      _currentStep--;
      _stepType = _steps[_currentStep].type;
      if (_stepType == StepType.rest) {
        resetRestTimer(45);
      } else if (_stepType == StepType.cooldown) {
        resetRestTimer(15);
      }
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

  void checkAndNavigate(BuildContext context) async {
    if (_currentStep >= _steps.length && context.mounted) {
      await _workoutHistoryService.addWorkoutHistory(
        WorkoutHistory(
          date: DateTime.now(),
          status: WorkoutStatusEnum.completed,
        ),
      );
      context.pushNamed('plan_complete');
    }
  }

  @override
  void dispose() {
    _stopTimer();
    stopRestTimer();
    super.dispose();
  }
}
