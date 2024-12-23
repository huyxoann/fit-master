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
  Abductors,
  Abs,
  Adductors,
  Biceps,
  Calves,
  Chest,
  Forearms,
  Glutes,
  Hamstrings,
  HipFlexors,
  ITBand,
  Lats,
  LowerBack,
  UpperBack,
  Neck,
  Obliques,
  PalmarFascia,
  PlantarFascia,
  Quads,
  Shoulders,
  Traps,
  Triceps,
}

extension TargetMuscleExtension on TargetMuscle {
  String get name {
    switch (this) {
      case TargetMuscle.Abductors:
        return 'Abductors';
      case TargetMuscle.Abs:
        return 'Abs';
      case TargetMuscle.Adductors:
        return 'Adductors';
      case TargetMuscle.Biceps:
        return 'Biceps';
      case TargetMuscle.Calves:
        return 'Calves';
      case TargetMuscle.Chest:
        return 'Chest';
      case TargetMuscle.Forearms:
        return 'Forearms';
      case TargetMuscle.Glutes:
        return 'Glutes';
      case TargetMuscle.Hamstrings:
        return 'Hamstrings';
      case TargetMuscle.HipFlexors:
        return 'Hip Flexors';
      case TargetMuscle.ITBand:
        return 'IT Band';
      case TargetMuscle.Lats:
        return 'Lats';
      case TargetMuscle.LowerBack:
        return 'Lower Back';
      case TargetMuscle.UpperBack:
        return 'Upper Back';
      case TargetMuscle.Neck:
        return 'Neck';
      case TargetMuscle.Obliques:
        return 'Obliques';
      case TargetMuscle.PalmarFascia:
        return 'Palmar Fascia';
      case TargetMuscle.PlantarFascia:
        return 'Plantar Fascia';
      case TargetMuscle.Quads:
        return 'Quads';
      case TargetMuscle.Shoulders:
        return 'Shoulders';
      case TargetMuscle.Traps:
        return 'Traps';
      case TargetMuscle.Triceps:
        return 'Triceps';
      default:
        return '';
    }
  }
}

enum ExerciseType {
  Aerobic,
  Strength,
  Stretching,
  Balance,
  Warmup,
  SMR,
  FoamRoll,
  Activation,
  Plyometrics
}

extension ExerciseTypeExtension on ExerciseType {
  String get vietnameseName {
    switch (this) {
      case ExerciseType.Aerobic:
        return 'Aerobic';
      case ExerciseType.Strength:
        return 'Sức Mạnh';
      case ExerciseType.Stretching:
        return 'Kéo Dãn';
      case ExerciseType.Balance:
        return 'Cân Bằng';
      case ExerciseType.Warmup:
        return 'Khởi Động';
      case ExerciseType.SMR:
        return 'SMR';
      case ExerciseType.FoamRoll:
        return 'Lăn Xốp';
      case ExerciseType.Activation:
        return 'Kích Hoạt';
      case ExerciseType.Plyometrics:
        return 'Plyometrics';
      default:
        return '';
    }
  }
}

enum ExperienceLevel { Beginner, Intermediate, Advanced }

extension ExperienceLevelExtension on ExperienceLevel {
  String get name {
    switch (this) {
      case ExperienceLevel.Beginner:
        return 'Beginner';
      case ExperienceLevel.Intermediate:
        return 'Intermediate';
      case ExperienceLevel.Advanced:
        return 'Advanced';
      default:
        return '';
    }
  }
  // String get vietnameseName {
  //   switch (this) {
  //     case ExperienceLevel.Beginner:
  //       return 'Mới Bắt Đầu';
  //     case ExperienceLevel.Intermediate:
  //       return 'Trung Cấp';
  //     case ExperienceLevel.Advanced:
  //       return 'Nâng Cao';
  //     default:
  //       return '';
  //   }
  // }
}

enum ForceType {
  Pull,
  Static,
  Isometric,
  Push,
  DynamicStretching,
  Compression,
  NA,
  Hinge
}

extension ForceTypeExtension on ForceType {
  String get vietnameseName {
    switch (this) {
      case ForceType.Pull:
        return 'Kéo';
      case ForceType.Static:
        return 'Tĩnh';
      case ForceType.Isometric:
        return 'Isometric';
      case ForceType.Push:
        return 'Đẩy';
      case ForceType.DynamicStretching:
        return 'Kéo Dãn Động';
      case ForceType.Compression:
        return 'Nén';
      case ForceType.NA:
        return 'Không Có';
      case ForceType.Hinge:
        return 'Hinge';
      default:
        return '';
    }
  }
}

enum EquipmentRequired {
  Dumbbell,
  Barbell,
  Bands,
  Bodyweight,
  Bench,
  Cable,
  Machine,
  Other,
  JumpRope,
  ExerciseBall,
  EZBar,
  KettleBells,
  LacrosseBall,
  FoamRoll,
  TrapBar,
  Valslide,
  Rings,
  MedicineBall,
  TigerTail,
  Landmine
}

extension EquipmentRequiredExtension on EquipmentRequired {
  String get vietnameseName {
    switch (this) {
      case EquipmentRequired.Dumbbell:
        return 'Tạ Đơn';
      case EquipmentRequired.Barbell:
        return 'Tạ Đòn';
      case EquipmentRequired.Bands:
        return 'Dây Căng';
      case EquipmentRequired.Bodyweight:
        return 'Cân Nặng Cơ Thể';
      case EquipmentRequired.Bench:
        return 'Băng Ghế';
      case EquipmentRequired.Cable:
        return 'Dây Cáp';
      case EquipmentRequired.Machine:
        return 'Máy Móc';
      case EquipmentRequired.Other:
        return 'Khác';
      case EquipmentRequired.JumpRope:
        return 'Dây Nhảy';
      case EquipmentRequired.ExerciseBall:
        return 'Bóng Tập';
      case EquipmentRequired.EZBar:
        return 'Tạ EZ';
      case EquipmentRequired.KettleBells:
        return 'Tạ Tay';
      case EquipmentRequired.LacrosseBall:
        return 'Bóng Lacrosse';
      case EquipmentRequired.FoamRoll:
        return 'Rulo Xốp';
      case EquipmentRequired.TrapBar:
        return 'Tạ Bẫy';
      case EquipmentRequired.Valslide:
        return 'Valslide';
      case EquipmentRequired.Rings:
        return 'Dây Nhảy';
      case EquipmentRequired.MedicineBall:
        return 'Bóng Thuốc';
      case EquipmentRequired.TigerTail:
        return 'Dây Xoắn Tiger';
      case EquipmentRequired.Landmine:
        return 'Landmine';
      default:
        return '';
    }
  }
}

enum Mechanic { Compound, Isolation }

extension MechanicExtension on Mechanic {
  String get vietnameseName {
    switch (this) {
      case Mechanic.Compound:
        return 'Phức Hợp';
      case Mechanic.Isolation:
        return 'Cô Lập';
      default:
        return '';
    }
  }
}

enum FoodCategory {
  ProteinShake,
  ProteinBar,
  HighProtein,
  LowCarb,
  Snack,
  Vegetarian,
  Breakfast,
  Lunch,
  Dinner,
  BBQGrill
}

extension FoodCategoryExtension on FoodCategory {
  String get vietnameseName {
    switch (this) {
      case FoodCategory.ProteinShake:
        return 'Sinh Tố Protein';
      case FoodCategory.ProteinBar:
        return 'Thanh Protein';
      case FoodCategory.HighProtein:
        return 'Chế Độ Cao Protein';
      case FoodCategory.LowCarb:
        return 'Chế Độ Ít Carb';
      case FoodCategory.Snack:
        return 'Bữa Ăn Nhẹ';
      case FoodCategory.Vegetarian:
        return 'Chay';
      case FoodCategory.Breakfast:
        return 'Bữa Sáng';
      case FoodCategory.Lunch:
        return 'Bữa Trưa';
      case FoodCategory.Dinner:
        return 'Bữa Tối';
      case FoodCategory.BBQGrill:
        return 'Nướng BBQ';
      default:
        return '';
    }
  }
}

enum Gender { Male, Female, Both }

extension GenderExtension on Gender {
  String get vietnameseName {
    switch (this) {
      case Gender.Male:
        return 'Nam';
      case Gender.Female:
        return 'Nữ';
      case Gender.Both:
        return 'Cả Hai';
      default:
        return '';
    }
  }
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
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

extension DayOfWeekExtension on DayOfWeek {
  String get vietnameseName {
    switch (this) {
      case DayOfWeek.Monday:
        return 'Thứ Hai';
      case DayOfWeek.Wednesday:
        return 'Thứ Tư';
      case DayOfWeek.Friday:
        return 'Thứ Sáu';
      case DayOfWeek.Sunday:
        return 'Chủ Nhật';
      case DayOfWeek.Tuesday:
        return 'Thứ Ba';
      case DayOfWeek.Thursday:
        return 'Thứ Năm';
      case DayOfWeek.Saturday:
        return 'Thứ Bảy';
      default:
        return '';
    }
  }
}

enum EquipmentCategory {
  ExerciseEquipment,
  HouseholdItems,
  OutdoorEquipment,
  SportsEquipment,
  OfficeEquipment,
  ComputerAccessories,
  VirtualEquipment
}

extension EquipmentCategoryExtension on EquipmentCategory {
  String get vietnameseName {
    switch (this) {
      case EquipmentCategory.ExerciseEquipment:
        return 'Thiết Bị Tập Luyện';
      case EquipmentCategory.HouseholdItems:
        return 'Vật Dụng Gia Dụng';
      case EquipmentCategory.OutdoorEquipment:
        return 'Thiết Bị Ngoài Trời';
      case EquipmentCategory.SportsEquipment:
        return 'Thiết Bị Thể Thao';
      case EquipmentCategory.OfficeEquipment:
        return 'Thiết Bị Văn Phòng';
      case EquipmentCategory.ComputerAccessories:
        return 'Phụ Kiện Máy Tính';
      case EquipmentCategory.VirtualEquipment:
        return 'Thiết Bị Ảo';
      default:
        return '';
    }
  }
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

extension WorkoutTypeExt on WorkoutType {
  String get name {
    switch (this) {
      case WorkoutType.split:
        return "Chia Ngày";
      case WorkoutType.fullBody:
        return "Toàn Thân";
    }
  }
}

enum StepType {
  exercise,
  rest,
  superset,
  circuit,
  warmup,
  cooldown,
}
