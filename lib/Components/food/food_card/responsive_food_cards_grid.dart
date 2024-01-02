import 'package:app/Components/food/food_card/food_card.dart';
import 'package:app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class ResponsiveFoodCardsGrid extends StatelessWidget {
  const ResponsiveFoodCardsGrid({super.key, required this.availableMeals});
  final List<FoodData> availableMeals;

  @override
  Widget build(BuildContext context) {
    List<FoodCard> mealsCards = [];
    for (var meal in availableMeals) {
      mealsCards.add(FoodCard(
        foodData: meal,
      ));
    }

    return ResponsiveGridList(
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
      ], // The list of widgets in the list
    );
  }
}
