import 'package:fit_master/src/features/food/repositories/food.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../core/exception/response/api_response.dart';
import '../models/food.dart'; // Import Logger nếu cần

class FoodViewModel with ChangeNotifier {
  final FoodRepository _foodRepository;
  ApiResponse<ListFood>? _foodListResponse;
  final Logger _logger = Logger();

  FoodViewModel(this._foodRepository);

  ApiResponse<ListFood>? get foodListResponse => _foodListResponse;

  Future<void> fetchListFood() async {

    //lay token tu local
    //  final token = await Datalocal.getAccessToken();

    _foodListResponse = ApiResponse.loading();
    notifyListeners(); // Cập nhật trạng thái UI

    try {
      ListFood foodList = await _foodRepository.fetchListFood("token");
      _foodListResponse = ApiResponse.completed(foodList);
    } catch (e) {
      _logger.e("Lỗi khi lấy danh sách thực phẩm: $e");
      _foodListResponse = ApiResponse.error("Không thể tải danh sách thực phẩm");
    }

    notifyListeners(); // Cập nhật trạng thái UI sau khi nhận dữ liệu
  }
}
