import 'package:app/models/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodNotifier extends StateNotifier<FoodProviderData> {
  FoodNotifier()
      : super(FoodProviderData(
          completeMenu: [],
          filteredMenu: [],
        ));

  void loadFood(List<FoodData> foodList) {
    state = FoodProviderData(
      completeMenu: foodList,
      filteredMenu: foodList,
    );
  }

  void applyFilters(List<String> filtersInput) {
    List<FoodData> filteredMenu = [];

    for (var meal in state.completeMenu) {
      for (var filter in filtersInput) {
        if (meal.description.contains(filter)) {
          filteredMenu.add(meal);
        }
      }
    }

    state = FoodProviderData(
      completeMenu: state.completeMenu,
      filteredMenu: filteredMenu,
    );
  }
}

final foodProvider = StateNotifierProvider<FoodNotifier, FoodProviderData>(
    (ref) => FoodNotifier());
