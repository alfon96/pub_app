import 'package:app/Components/UI/Loading/http_loading_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/cart/floating_cart_button.dart';
import 'package:app/Components/config/config.dart';
import 'package:app/Components/filters/filter_card.dart';
import 'package:app/Components/filters/responsive_filters_grid.dart';
import 'package:app/Components/food/food_card/food_404.dart';
import 'package:app/Components/food/food_card/responsive_food_cards_grid.dart';
import 'package:app/Components/food/food_heading.dart';
import 'package:app/data/food_data.dart';
import 'package:app/models/cart.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/cart.dart';
import 'package:app/providers/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class FoodAssemble extends ConsumerStatefulWidget {
  const FoodAssemble({super.key});

  @override
  ConsumerState<FoodAssemble> createState() => _FoodAssembleState();
}

class _FoodAssembleState extends ConsumerState<FoodAssemble> {
  Future<http.Response> fetchMeals() async {
    return await http.get(Uri.parse("https://jsonplaceholder.typicode.com"));
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
            child: Food404(haveFilters: activeFilters.isNotEmpty),
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
    return HttpLoadingWrapper(
      httpRequest: fetchMeals,
      informProvider: () {
        ref.read(foodProvider.notifier).loadFood(menuItems);
      },
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Config.xl),
        children: children,
      ),
    );
  }
}
