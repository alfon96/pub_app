import 'package:app/Components/UI/animations/translation_animator.dart';
import 'package:app/Components/config/config.dart';
import 'package:app/Components/food/food_card/food_404.dart';
import 'package:app/Components/food/food_card/food_card.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class ResponsiveFoodCardsGrid extends ConsumerWidget {
  const ResponsiveFoodCardsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Menu menu = ref.watch(foodProvider).filteredMenu;
    final activeFilters = ref.watch(foodProvider).activeFilters;

    var mealsCards = <Widget>[];
    for (int i = 0; i < menu.items.length; i++) {
      Widget mealCard = FoodCard(foodData: menu.items[i]);

      // Apply animation just to the first item
      if (i == 0) {
        mealCard = TranslationAnimator(
          displacement: 30,
          inactiveDelay: 10,
          initialDelay: 1600,
          child: mealCard,
        );
      }

      mealsCards.add(mealCard);
    }

    return menu.items.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: Config.xl),
            child: Food404(haveFilters: activeFilters.isNotEmpty),
          )
        : ResponsiveGridList(
            rowMainAxisAlignment: MainAxisAlignment.center,
            horizontalGridSpacing: 2, // Horizontal space between grid items
            verticalGridSpacing: 4, // Vertical space between grid items
            horizontalGridMargin: 0, // Horizontal space around the grid
            verticalGridMargin: 32, // Vertical space around the grid
            minItemWidth:
                300, // The minimum item width (can be smaller, if the layout constraints are smaller)
            minItemsPerRow:
                1, // The minimum items to show in a single row. Takes precedence over minItemWidth
            maxItemsPerRow:
                5, // The maximum items to show in a single row. Can be useful on large screens
            listViewBuilderOptions: ListViewBuilderOptions(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
            ), // Options that are getting passed to the ListView.builder() function

            children: [
              ...mealsCards, // The list of w
            ],

            // Applica l'animazione solo al primo elemento
          );
  }
}
