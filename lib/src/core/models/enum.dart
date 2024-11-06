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
  String get vietnameseName {
    switch (this) {
      case TargetMuscle.Abductors: return 'Cơ khép ngoài';
      case TargetMuscle.Abs: return 'Cơ Bụng';
      case TargetMuscle.Adductors: return 'Cơ Khép';
      case TargetMuscle.Biceps: return 'Cơ Tay Trước';
      case TargetMuscle.Calves: return 'Cơ Bắp Chân';
      case TargetMuscle.Chest: return 'Cơ Ngực';
      case TargetMuscle.Forearms: return 'Cơ Cẳng Tay';
      case TargetMuscle.Glutes: return 'Cơ Mông';
      case TargetMuscle.Hamstrings: return 'Cơ Đùi Sau';
      case TargetMuscle.HipFlexors: return 'Cơ Gập Hông';
      case TargetMuscle.ITBand: return 'Dải Chậu Chày';
      case TargetMuscle.Lats: return 'Cơ Lưng Xô';
      case TargetMuscle.LowerBack: return 'Cơ Lưng Dưới';
      case TargetMuscle.UpperBack: return 'Cơ Lưng Trên';
      case TargetMuscle.Neck: return 'Cơ Cổ';
      case TargetMuscle.Obliques: return 'Cơ Chéo';
      case TargetMuscle.PalmarFascia: return 'Màng Gan Bàn Tay';
      case TargetMuscle.PlantarFascia: return 'Màng Gan Bàn Chân';
      case TargetMuscle.Quads: return 'Cơ Đùi Trước';
      case TargetMuscle.Shoulders: return 'Cơ Vai';
      case TargetMuscle.Traps: return 'Cơ Cái Bẫy';
      case TargetMuscle.Triceps: return 'Cơ Tay Sau';
      default: return '';
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
      case ExerciseType.Aerobic: return 'Aerobic';
      case ExerciseType.Strength: return 'Sức Mạnh';
      case ExerciseType.Stretching: return 'Kéo Dãn';
      case ExerciseType.Balance: return 'Cân Bằng';
      case ExerciseType.Warmup: return 'Khởi Động';
      case ExerciseType.SMR: return 'SMR';
      case ExerciseType.FoamRoll: return 'Lăn Xốp';
      case ExerciseType.Activation: return 'Kích Hoạt';
      case ExerciseType.Plyometrics: return 'Plyometrics';
      default: return '';
    }
  }
}

enum ExperienceLevel {
  Beginner, 
  Intermediate, 
  Advanced
}

extension ExperienceLevelExtension on ExperienceLevel {
  String get vietnameseName {
    switch (this) {
      case ExperienceLevel.Beginner: return 'Mới Bắt Đầu';
      case ExperienceLevel.Intermediate: return 'Trung Cấp';
      case ExperienceLevel.Advanced: return 'Nâng Cao';
      default: return '';
    }
  }
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
      case ForceType.Pull: return 'Kéo';
      case ForceType.Static: return 'Tĩnh';
      case ForceType.Isometric: return 'Isometric';
      case ForceType.Push: return 'Đẩy';
      case ForceType.DynamicStretching: return 'Kéo Dãn Động';
      case ForceType.Compression: return 'Nén';
      case ForceType.NA: return 'Không Có';
      case ForceType.Hinge: return 'Hinge';
      default: return '';
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
      case EquipmentRequired.Dumbbell: return 'Tạ Đơn';
      case EquipmentRequired.Barbell: return 'Tạ Đòn';
      case EquipmentRequired.Bands: return 'Dây Căng';
      case EquipmentRequired.Bodyweight: return 'Cân Nặng Cơ Thể';
      case EquipmentRequired.Bench: return 'Băng Ghế';
      case EquipmentRequired.Cable: return 'Dây Cáp';
      case EquipmentRequired.Machine: return 'Máy Móc';
      case EquipmentRequired.Other: return 'Khác';
      case EquipmentRequired.JumpRope: return 'Dây Nhảy';
      case EquipmentRequired.ExerciseBall: return 'Bóng Tập';
      case EquipmentRequired.EZBar: return 'Tạ EZ';
      case EquipmentRequired.KettleBells: return 'Tạ Tay';
      case EquipmentRequired.LacrosseBall: return 'Bóng Lacrosse';
      case EquipmentRequired.FoamRoll: return 'Rulo Xốp';
      case EquipmentRequired.TrapBar: return 'Tạ Bẫy';
      case EquipmentRequired.Valslide: return 'Valslide';
      case EquipmentRequired.Rings: return 'Dây Nhảy';
      case EquipmentRequired.MedicineBall: return 'Bóng Thuốc';
      case EquipmentRequired.TigerTail: return 'Dây Xoắn Tiger';
      case EquipmentRequired.Landmine: return 'Landmine';
      default: return '';
    }
  }
}

enum Mechanic {
  Compound, 
  Isolation
}

extension MechanicExtension on Mechanic {
  String get vietnameseName {
    switch (this) {
      case Mechanic.Compound: return 'Phức Hợp';
      case Mechanic.Isolation: return 'Cô Lập';
      default: return '';
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
      case FoodCategory.ProteinShake: return 'Sinh Tố Protein';
      case FoodCategory.ProteinBar: return 'Thanh Protein';
      case FoodCategory.HighProtein: return 'Chế Độ Cao Protein';
      case FoodCategory.LowCarb: return 'Chế Độ Ít Carb';
      case FoodCategory.Snack: return 'Bữa Ăn Nhẹ';
      case FoodCategory.Vegetarian: return 'Chay';
      case FoodCategory.Breakfast: return 'Bữa Sáng';
      case FoodCategory.Lunch: return 'Bữa Trưa';
      case FoodCategory.Dinner: return 'Bữa Tối';
      case FoodCategory.BBQGrill: return 'Nướng BBQ';
      default: return '';
    }
  }
}

enum Gender {
  Male, 
  Female, 
  Both
}

extension GenderExtension on Gender {
  String get vietnameseName {
    switch (this) {
      case Gender.Male: return 'Nam';
      case Gender.Female: return 'Nữ';
      case Gender.Both: return 'Cả Hai';
      default: return '';
    }
  }
}

enum FitnessGoal {
  FatLoss, 
  MuscleBuilding, 
  IncreaseStrength, 
  SportsPerformance, 
  BodyWeight, 
  Cardio
}

extension FitnessGoalExtension on FitnessGoal {
  String get vietnameseName {
    switch (this) {
      case FitnessGoal.FatLoss: return 'Giảm Mỡ';
      case FitnessGoal.MuscleBuilding: return 'Tăng Cơ';
      case FitnessGoal.IncreaseStrength: return 'Tăng Sức Mạnh';
      case FitnessGoal.SportsPerformance: return 'Thể Thao';
      case FitnessGoal.BodyWeight: return 'Cân Nặng';
      case FitnessGoal.Cardio: return 'Cardio';
      default: return '';
    }
  }
}

enum DayOfWeek {
  Monday, 
  Wednesday, 
  Friday, 
  Sunday, 
  Tuesday, 
  Thursday, 
  Saturday
}

extension DayOfWeekExtension on DayOfWeek {
  String get vietnameseName {
    switch (this) {
      case DayOfWeek.Monday: return 'Thứ Hai';
      case DayOfWeek.Wednesday: return 'Thứ Tư';
      case DayOfWeek.Friday: return 'Thứ Sáu';
      case DayOfWeek.Sunday: return 'Chủ Nhật';
      case DayOfWeek.Tuesday: return 'Thứ Ba';
      case DayOfWeek.Thursday: return 'Thứ Năm';
      case DayOfWeek.Saturday: return 'Thứ Bảy';
      default: return '';
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
      case EquipmentCategory.ExerciseEquipment: return 'Thiết Bị Tập Luyện';
      case EquipmentCategory.HouseholdItems: return 'Vật Dụng Gia Dụng';
      case EquipmentCategory.OutdoorEquipment: return 'Thiết Bị Ngoài Trời';
      case EquipmentCategory.SportsEquipment: return 'Thiết Bị Thể Thao';
      case EquipmentCategory.OfficeEquipment: return 'Thiết Bị Văn Phòng';
      case EquipmentCategory.ComputerAccessories: return 'Phụ Kiện Máy Tính';
      case EquipmentCategory.VirtualEquipment: return 'Thiết Bị Ảo';
      default: return '';
    }
  }
}
