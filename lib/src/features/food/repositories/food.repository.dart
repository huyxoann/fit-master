
import 'package:fit_master/src/features/food/models/food.dart';

abstract class FoodRepository {
  Future<List<Food>> fetchListFood(String token);
}
