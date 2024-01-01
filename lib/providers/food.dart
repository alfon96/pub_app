import 'package:app/models/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodNotifier extends StateNotifier<List<FoodData>> {
  FoodNotifier() : super([]);

  void loadFood(List<FoodData> foodList) {
    state = foodList;
  }
}

final foodProvider = StateNotifierProvider<FoodNotifier, List<FoodData>>(
    (ref) => FoodNotifier());
