import 'food_detail.dart';

class DietPlan {
  final int dietPlanId;
  final String dietName;
  final int userId;
  final List<DietPlanDetail> dietPlanDetails;

  DietPlan({
    required this.dietPlanId,
    required this.dietName,
    required this.userId,
    required this.dietPlanDetails,
  });

  factory DietPlan.fromJson(Map<String, dynamic> json) {
    return DietPlan(
      dietPlanId: json['diet_plan_id'],
      dietName: json['diet_name'],
      userId: json['user_id'],
    
      dietPlanDetails: (json['dietPlanDetails'] as List)
          .map((detail) => DietPlanDetail.fromJson(detail))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diet_plan_id': dietPlanId,
      'diet_name': dietName,
      'user_id': userId,
      'dietPlanDetails': dietPlanDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}
