import 'package:fit_master/src/config/logger/logger.dart';
import 'package:fit_master/src/features/plan/model/my_plan.dart';
import 'package:fit_master/src/features/plan/repository/my_plan.repository.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class MyPlanViewModel extends ChangeNotifier {
  final MyPlanRepository myPlanRepository;

  MyPlanViewModel({required this.myPlanRepository});

  MyPlan? _myPlan;
  bool _isLoading = false;

  MyPlan? get myPlan => _myPlan;
  bool get isLoading => _isLoading;

  Future<void> fetchMyPlan() async {
    Hive.openBox('userDataBox');
    final userId = Hive.box('userDataBox').get('userId');
    final token = Hive.box('userDataBox').get('token');

    _isLoading = true;
    notifyListeners();
    try {
      _myPlan =
          await myPlanRepository.fetchMyPlan(userId: userId, token: token);
      notifyListeners();
    } catch (e) {
      // Handle error
      logger.e(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshMyPlan() async {
    await fetchMyPlan();
  }
}
