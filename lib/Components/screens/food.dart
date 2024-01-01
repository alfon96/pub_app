import 'package:app/Components/filters/checkbox_food.dart';
import 'package:app/Components/food/food_card.dart';
import 'package:app/data/food_data.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_grid_list/responsive_grid_list.dart';

// Assicurati che il widget sia uno StatefulWidget se vuoi utilizzare initState.
class Food extends ConsumerStatefulWidget {
  const Food({super.key});

  @override
  ConsumerState<Food> createState() => _FoodState();
}

class _FoodState extends ConsumerState<Food> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      fetchMeals();
    });
  }

  Future<void> fetchMeals() async {
    try {
      final response =
          await http.get(Uri.parse("https://jsonplaceholder.typicode.com"));

      if (response.statusCode >= 400) {
        throw Exception('Failed to contact google.');
      }

      ref.read(foodProvider.notifier).loadFood(menuItems);
    } catch (e) {
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // State for Filters checkboxes
    final menu = ref.watch(foodProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    List<FoodCard> mealsCards = [];
    List<CheckboxFood> filterCheckboxes = [];

    for (var meal in menuItems) {
      mealsCards.add(FoodCard(foodData: meal));
    }
    for (var badge in foodFilters) {
      filterCheckboxes.add(CheckboxFood(foodBadge: badge));
    }

    // double screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Food',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 56, 42, 1),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Text(
            'Use filters to match your diet:',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromARGB(255, 56, 42, 1),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 1,
            child: ResponsiveGridList(
              rowMainAxisAlignment: MainAxisAlignment.center,

              horizontalGridSpacing: 0, // Horizontal space between grid items
              verticalGridSpacing: 0, // Vertical space between grid items
              horizontalGridMargin: 0, // Horizontal space around the grid
              verticalGridMargin: 0, // Vertical space around the grid
              minItemWidth:
                  80, // The minimum item width (can be smaller, if the layout constraints are smaller)
              minItemsPerRow:
                  2, // The minimum items to show in a single row. Takes precedence over minItemWidth
              maxItemsPerRow: filterCheckboxes
                  .length, // The maximum items to show in a single row. Can be useful on large screens
              listViewBuilderOptions: ListViewBuilderOptions(
                shrinkWrap: true,
              ), // Options that are getting passed to the ListView.builder() function

              children: filterCheckboxes, // The list of widgets in the list
            ),
          ),
          Flexible(
            flex: 10,
            child: ResponsiveGridList(
              rowMainAxisAlignment: MainAxisAlignment.center,
              horizontalGridSpacing: 10, // Horizontal space between grid items
              verticalGridSpacing: 5, // Vertical space between grid items
              horizontalGridMargin: 0, // Horizontal space around the grid
              verticalGridMargin: 10, // Vertical space around the grid
              minItemWidth:
                  160, // The minimum item width (can be smaller, if the layout constraints are smaller)
              minItemsPerRow:
                  1, // The minimum items to show in a single row. Takes precedence over minItemWidth
              maxItemsPerRow:
                  5, // The maximum items to show in a single row. Can be useful on large screens
              listViewBuilderOptions:
                  ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function

              children: mealsCards, // The list of widgets in the list
            ),
          ),
        ],
      ),
    );
  }
}
