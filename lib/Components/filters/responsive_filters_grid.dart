import 'package:app/Components/filters/filter_card.dart';
import 'package:flutter/material.dart';
import 'package:app/models/food.dart';

class ResponsiveFiltersGrid extends StatelessWidget {
  const ResponsiveFiltersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<FilterCard> filterCheckboxes = [];

    for (var badge in foodFilters) {
      filterCheckboxes.add(FilterCard(foodBadge: badge));
    }

    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 16,
      children: [
        ...filterCheckboxes,
      ],
    );
  }
}
