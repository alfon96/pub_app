import 'package:app/models/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodNotifier extends StateNotifier<FoodProviderData> {
  FoodNotifier()
      : super(FoodProviderData(
          completeMenu: Menu(items: []),
          filteredMenu: Menu(items: []),
          activeFilters: [],
        ));

  void loadFood(Menu foodList) {
    print("Provider called");
    state = FoodProviderData(
      completeMenu: foodList,
      filteredMenu: foodList,
      activeFilters: state.activeFilters,
    );
  }

  void applyFilters(String inputFilter) {
    List<FoodData> filteredMenu = [];
    List<String> activeFilters = state.activeFilters;

    if (activeFilters.contains(inputFilter)) {
      activeFilters.remove(inputFilter);
    } else {
      activeFilters.add(inputFilter);
    }

    if (activeFilters.isEmpty) {
      state = FoodProviderData(
          completeMenu: state.completeMenu,
          filteredMenu: state.completeMenu,
          activeFilters: []);
    } else {
      for (var meal in state.completeMenu.items) {
        for (var filter in state.activeFilters) {
          if (meal.keywords.contains(filter)) {
            filteredMenu.add(meal);
          }
        }
      }

      state = FoodProviderData(
          completeMenu: state.completeMenu,
          filteredMenu: Menu(items: filteredMenu),
          activeFilters: activeFilters);
    }
  }
}

final foodProvider = StateNotifierProvider<FoodNotifier, FoodProviderData>(
    (ref) => FoodNotifier());
