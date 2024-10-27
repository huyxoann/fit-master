enum FitnessGoalEnum { LossFat, MuscleGain, KeepFit, GainWeight }

extension FitnessGoalExt on FitnessGoalEnum {
  String get name {
    switch (this) {
      case FitnessGoalEnum.LossFat:
        return "Giảm cân";
      case FitnessGoalEnum.MuscleGain:
        return "Tăng cơ";
      case FitnessGoalEnum.KeepFit:
        return "Giữ dáng";
      case FitnessGoalEnum.GainWeight:
        return "Tăng cân";
    }
  }
}
