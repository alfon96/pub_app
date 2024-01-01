import 'package:app/Components/filters/checkbox_food.dart';
import 'package:app/Components/food/food_card.dart';
import 'package:app/Components/food/food_heading.dart';
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
    final menu = ref.watch(foodProvider).filteredMenu;
    double screenWidth = MediaQuery.of(context).size.width;
    List<FoodCard> mealsCards = [];
    List<CheckboxFood> filterCheckboxes = [];

    for (var meal in menu) {
      mealsCards.add(FoodCard(foodData: meal));
    }
    for (var badge in foodFilters) {
      filterCheckboxes.add(CheckboxFood(foodBadge: badge));
    }

    // double screenheight = MediaQuery.of(context).size.height;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: <Widget>[
        const SizedBox(height: 10),
        const FoodHeading(),
        const SizedBox(height: 15),
        ResponsiveGridList(
          horizontalGridSpacing: 0, // Horizontal space between grid items
          verticalGridSpacing: 0, // Vertical space between grid items
          horizontalGridMargin: 0, // Horizontal space around the grid
          verticalGridMargin: 0, // Vertical space around the grid

          minItemWidth:
              140, // The minimum item width (can be smaller, if the layout constraints are smaller)
          minItemsPerRow:
              2, // The minimum items to show in a single row. Takes precedence over minItemWidth
          maxItemsPerRow:
              5, // The maximum items to show in a single row. Can be useful on large screens
          listViewBuilderOptions: ListViewBuilderOptions(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
          ), // Options that are getting passed to the ListView.builder() function

          children: [
            ...filterCheckboxes, // The list of w
          ], // The list of widgets in the list
        ),
        const Padding(
          padding: EdgeInsets.only(top: 7.0, bottom: 10.0),
          child: Divider(),
        ),
        ResponsiveGridList(
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
          listViewBuilderOptions: ListViewBuilderOptions(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
          ), // Options that are getting passed to the ListView.builder() function

          children: [
            ...mealsCards, // The list of w
          ], // The list of widgets in the list
        ),
      ],
    );
    // Column(
    //   children: [
    //     const FoodHeading(),
    //     Expanded(
    //       child: ResponsiveGridList(
    //         rowMainAxisAlignment: MainAxisAlignment.center,
    //         horizontalGridSpacing: 10, // Horizontal space between grid items
    //         verticalGridSpacing: 5, // Vertical space between grid items
    //         horizontalGridMargin: 0, // Horizontal space around the grid
    //         verticalGridMargin: 10, // Vertical space around the grid
    //         minItemWidth:
    //             160, // The minimum item width (can be smaller, if the layout constraints are smaller)
    //         minItemsPerRow:
    //             1, // The minimum items to show in a single row. Takes precedence over minItemWidth
    //         maxItemsPerRow:
    //             5, // The maximum items to show in a single row. Can be useful on large screens
    //         listViewBuilderOptions: ListViewBuilderOptions(
    //           physics: const ClampingScrollPhysics(),
    //         ), // Options that are getting passed to the ListView.builder() function

    //         children: [
    //           ...filterCheckboxes, // The list of w
    //           ...mealsCards,
    //         ], // The list of widgets in the list
    //       ),
    //     ),
    //   ],
    // ),
  }
}
