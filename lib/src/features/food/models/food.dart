import 'food_detail.dart';

class Food {
  final int foodId;
  final String foodName;
  final String categoryFood;
  final int? calories;
  final double? protein;
  final double? carb;
  final double? fat;
  final double? cookingTime;
  final String? ingredient;
  final String? cookingInstruction;
  final String? coverImage;
  final DietPlanDetail? dietPlanDetail;

  Food({
    required this.foodId,
    required this.foodName,
    required this.categoryFood,
    this.calories,
    this.protein,
    this.carb,
    this.fat,
    this.cookingTime,
    this.ingredient,
    this.cookingInstruction,
    this.coverImage,
    this.dietPlanDetail,
  });

  // Tạo một factory method từ JSON
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodId: json['food_id'],
      foodName: json['food_name'],
      categoryFood: json['category_food'],
      calories: json['calories'],
      protein: json['protein']?.toDouble(),
      carb: json['carb']?.toDouble(),
      fat: json['fat']?.toDouble(),
      cookingTime: json['cooking_time']?.toDouble(),
      ingredient: json['ingredient'],
      cookingInstruction: json['cooking_instruction'],
      coverImage: json['cover_image'],
      dietPlanDetail: json['dietPlanDetail'] != null 
          ? DietPlanDetail.fromJson(json['dietPlanDetail']) 
          : null,
    );
  }

  // Chuyển đổi sang JSON
  Map<String, dynamic> toJson() {
    return {
      'food_id': foodId,
      'food_name': foodName,
      'category_food': categoryFood,
      'calories': calories,
      'protein': protein,
      'carb': carb,
      'fat': fat,
      'cooking_time': cookingTime,
      'ingredient': ingredient,
      'cooking_instruction': cookingInstruction,
      'cover_image': coverImage,
      'dietPlanDetail': dietPlanDetail?.toJson(),
    };
  }
}

class ListFood {
  List<Food>? listFood;
  ListFood({this.listFood});

  ListFood.fromJson(List<dynamic> json) {
    listFood = <Food>[];
    for (var v in json) {
      listFood!.add(Food.fromJson(v));
    }
  }
}
