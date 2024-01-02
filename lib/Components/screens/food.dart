import 'package:app/Components/cart/floating_cart_button.dart';
import 'package:app/Components/config/config.dart';
import 'package:app/Components/filters/filter_card.dart';
import 'package:app/Components/filters/responsive_filters_grid.dart';
import 'package:app/Components/food/food_card/food_404.dart';
import 'package:app/Components/food/food_card/food_card.dart';
import 'package:app/Components/food/food_card/responsive_food_cards_grid.dart';
import 'package:app/Components/food/food_heading.dart';
import 'package:app/data/food_data.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/food.dart';
import 'package:flutter/material.dart';
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
    final activeFilters = ref.watch(foodProvider).activeFilters;
    List<FilterCard> filterCheckboxes = [];

    Widget foodWidget = menu.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: Config.xl),
            child: Food404(haveFilters: activeFilters.isEmpty),
          )
        : ResponsiveFoodCardsGrid(availableMeals: menu);

    for (var badge in foodFilters) {
      filterCheckboxes.add(FilterCard(foodBadge: badge));
    }

    // Page Content to be displayed
    var children = <Widget>[
      const SizedBox(height: Config.xl),
      const FoodHeading(),
      const SizedBox(height: Config.xl),
      const ResponsiveFiltersGrid(),
      const Padding(
        padding: EdgeInsets.only(top: Config.xl),
        child: Divider(
          thickness: Config.dividerThickness,
          color: Color.fromARGB(255, 71, 8, 126),
        ),
      ),
      foodWidget,
    ];

    // All Elements of the Page are inside the listView so that the whole page is scrollable,
    // For exception of the cart button that has to be always visible.
    return Stack(children: [
      ListView(
        padding: const EdgeInsets.symmetric(horizontal: Config.xl),
        children: children,
      ),

      // Fixed Button Bottom Left Cart Button
      const FloatingCartButton(),
    ]);
  }
}
