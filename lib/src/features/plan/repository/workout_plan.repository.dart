import 'package:fit_master/src/features/plan/model/my_plan.dart';

abstract class MyPlanRepository {
  Future<MyPlan> fetchMyPlan({required int userId, required String token});
}
