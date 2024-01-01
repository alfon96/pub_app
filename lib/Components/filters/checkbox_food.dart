import 'package:app/models/food.dart';
import 'package:app/providers/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CheckboxFood extends ConsumerStatefulWidget {
  const CheckboxFood({super.key, required this.foodBadge});
  final FoodFilterBadge foodBadge;

  @override
  ConsumerState<CheckboxFood> createState() => _CheckboxFoodState();
}

class _CheckboxFoodState extends ConsumerState<CheckboxFood> {
  bool isChecked = false;

  void handleFilters(bool? filter) {
    if (filter != null) {
      setState(() {
        isChecked = !isChecked;
        ref.read(foodProvider.notifier).applyFilters(widget.foodBadge.name);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ResponsiveGridRow(
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
              height: 48,
            ),
          ),
          ResponsiveGridCol(
            xs: 5,
            child: Text(
              textAlign: TextAlign.center,
              widget.foodBadge.name,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 56, 42, 1),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          ResponsiveGridCol(xs: 2, child: const SizedBox(width: 10)),
        ],
      ),
    );
  }
}
