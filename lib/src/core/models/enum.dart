enum GymLocation {
  gym,
  home,
}

extension GymLocationExt on GymLocation {
  String get name {
    switch (this) {
      case GymLocation.gym:
        return "Phòng tập";
      case GymLocation.home:
        return "Nhà";
    }
  }
}

enum TargetMuscle {
  abductors,
  abs,
  adductors,
  biceps,
  calves,
  chest,
  forearms,
  glutes,
  hamstrings,
  hipFlexors,
  itBand,
  lats,
  lowerBack,
  upperBack,
  neck,
  obliques,
  palmarFascia,
  plantarFascia,
  quads,
  shoulders,
  traps,
  triceps,
}

enum ExerciseType {
  aerobic,
  strength,
  stretching,
  balance,
}

enum ExperienceLevel {
  beginner,
  intermediate,
  advanced,
}

enum ForceType {
  pull,
  staticType,
  isometric,
  push,
}

enum EquipmentRequired {
  dumbbell,
  barbell,
  bodyweight,
  cable,
  machine,
  exercise,
  ezBar,
  kettleBells,
  lacrosseBall,
}

enum Mechanic {
  compound,
  isolation,
}

enum FoodCategory {
  proteinShake,
  proteinBar,
  highProtein,
  lowCarb,
  snack,
  vegetarian,
  breakfast,
  lunch,
  dinner,
  bbqGrill,
}

enum Gender {
  male,
  female,
  both,
}

enum FitnessGoal {
  fatLoss,
  muscleBuilding,
  cardio,
  increaseStrength,
  sportsPerformance,
  bodyWeight,
}

extension FitnessGoalExt on FitnessGoal {
  String get name {
    switch (this) {
      case FitnessGoal.fatLoss:
        return "Giảm cân";
      case FitnessGoal.muscleBuilding:
        return "Tăng cơ";
      case FitnessGoal.cardio:
        return "Giữ dáng";
      case FitnessGoal.bodyWeight:
        return "Tăng cân";
      case FitnessGoal.increaseStrength:
        return "Tăng sức mạnh";
      case FitnessGoal.sportsPerformance:
        return "Hiệu suất thể thao";
    }
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum WorkoutCategory {
  forMen,
  forWomen,
  muscleBuilding,
  fatLoss,
  increaseStrength,
  abWorkouts,
  fullBody,
  sportsPerformance,
  bodyweight,
  beginner,
  atHome,
  celebrity,
  cardio,
  chestWorkouts,
  backWorkouts,
  bicepWorkouts,
  shoulderWorkouts,
  legWorkouts,
  tricepWorkouts,
  gluteWorkouts,
}

enum WorkoutType {
  split,
  fullBody,
}
