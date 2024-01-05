import 'package:app/Components/UI/loading_wrapper/http_loading_wrapper.dart';
import 'package:app/Components/food/food_section_divider.dart';
import 'package:app/models/http.dart';
import 'package:flutter/material.dart';
import 'package:app/Components/config/config.dart';
import 'package:app/Components/food/food_filters/responsive_filters_grid.dart';
import 'package:app/Components/food/food_card/responsive_food_cards_grid.dart';
import 'package:app/Components/food/food_heading.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodAssemble extends ConsumerStatefulWidget {
  const FoodAssemble({
    super.key,
  });

  @override
  ConsumerState<FoodAssemble> createState() => _FoodAssembleState();
}

class _FoodAssembleState extends ConsumerState<FoodAssemble> {
  // Function to fetch MyDataModel from an API

  @override
  Widget build(BuildContext context) {
    String url = "https://alfo-server-test.duckdns.org/menu/Developer/pub_1";
    // Page Content to be displayed
    cachableUrls.add(url);

    var children = <Widget>[
      const FoodHeading(),
      const ResponsiveFiltersGrid(),
      const FoodSectionDivider(),
      const ResponsiveFoodCardsGrid(),
    ];

    // All Elements of the Page are inside the listView so that the whole page is scrollable,
    // For exception of the cart button that has to be always visible.
    return HttpLoadingWrapper<Menu>(
      fromJson: Menu.fromJson,
      providerFun: (Menu? data) {
        if (data != null) ref.read(foodProvider.notifier).loadFood(data);
      },
      url: url,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Config.xl),
        children: children,
      ),
    );
  }
}
