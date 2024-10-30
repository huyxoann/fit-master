
import 'package:fit_master/src/features/food/models/food.dart';

abstract class FoodRepository {
  Future<ListFood> fetchListFood(String token);
}
