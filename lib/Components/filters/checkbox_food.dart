import 'package:app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CheckboxFood extends StatefulWidget {
  const CheckboxFood({super.key, required this.foodBadge});
  final FoodFilterBadge foodBadge;

  @override
  State<CheckboxFood> createState() => _CheckboxFoodState();
}

class _CheckboxFoodState extends State<CheckboxFood> {
  bool isChecked = false;
  List filters = [];
  void handleFilters(bool? filter) {
    if (filter != null) {
      setState(() {
        if (filters.contains(filter)) {
          filters.remove(filter);
        } else {
          filters.add(filter);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveGridCol(xs: 2, child: const SizedBox(width: 10)),
        ResponsiveGridCol(
          xs: 2,
          child: Checkbox(
            side: const BorderSide(color: Color.fromARGB(255, 109, 83, 4)),
            shape: const CircleBorder(),
            value: isChecked,
            semanticLabel: widget.foodBadge.name,
            onChanged: handleFilters,
          ),
        ),
        ResponsiveGridCol(
          xs: 2,
          child: SvgPicture.asset(
            widget.foodBadge.iconPath,
            height: 25,
          ),
        ),
        ResponsiveGridCol(
          xs: 5,
          child: Text(
            textAlign: TextAlign.center,
            widget.foodBadge.name,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 56, 42, 1),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        ResponsiveGridCol(xs: 2, child: const SizedBox(width: 10)),
      ],
    );
  }
}
