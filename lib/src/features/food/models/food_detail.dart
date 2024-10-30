import 'diet_plan.dart';
import 'food.dart';

class DietPlanDetail {
  final int dietPlanDetailId;
  final int foodId;
  final int dietPlanId;
  final String dayOfWeek; // Nếu bạn có enum thì có thể sử dụng kiểu enum ở đây
  final Food food;
  final DietPlan dietPlan;

  DietPlanDetail({
    required this.dietPlanDetailId,
    required this.foodId,
    required this.dietPlanId,
    required this.dayOfWeek,
    required this.food,
    required this.dietPlan,
  });

  factory DietPlanDetail.fromJson(Map<String, dynamic> json) {
    return DietPlanDetail(
      dietPlanDetailId: json['diet_plan_detail_id'],
      foodId: json['food_id'],
      dietPlanId: json['diet_plan_id'],
      dayOfWeek: json['day_of_week'],
      food: Food.fromJson(json['food']),
      dietPlan: DietPlan.fromJson(json['dietPlan']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diet_plan_detail_id': dietPlanDetailId,
      'food_id': foodId,
      'diet_plan_id': dietPlanId,
      'day_of_week': dayOfWeek,
      'food': food.toJson(),
      'dietPlan': dietPlan.toJson(),
    };
  }
}
