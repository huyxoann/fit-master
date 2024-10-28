import 'package:fit_master/src/features/food/models/food.dart';
import 'package:fit_master/src/features/food/repositories/food.repository.dart';
import 'package:logger/logger.dart';

import '../../../core/services/base_api.service.dart';
import '../../../core/services/network_api.service.dart';

class FoodRepositoryImpl extends FoodRepository {
  final BaseApisService _apisService = NetworkApiService();
  final Logger _logger = Logger();

  @override
  Future<ListFood> fetchListFood(String token) async {
    try {
      final res = await _apisService.getApiResponse("AppInfo.fetchMarkEndPoint", token);
      _logger.i("Dữ liệu nhận được: $res"); // Sử dụng logger thay cho print
      return ListFood.fromJson(res);
    } catch (e) {
      _logger.e("Lỗi khi lấy dữ liệu: $e");
      rethrow; // Có thể ném một exception tùy chỉnh nếu cần
    }
  }
}
