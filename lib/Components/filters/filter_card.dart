import 'package:app/Components/config/config.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterCard extends ConsumerStatefulWidget {
  const FilterCard({super.key, required this.foodBadge});
  final FoodFilterBadge foodBadge;

  @override
  ConsumerState<FilterCard> createState() => _CheckboxFoodState();
}

class _CheckboxFoodState extends ConsumerState<FilterCard> {
  bool isChecked = false;

  void handleFilters() {
    setState(() {
      isChecked = !isChecked;
      ref.read(foodProvider.notifier).applyFilters(widget.foodBadge.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Config.splashColorFilterCard,
      onTap: handleFilters,
      borderRadius: BorderRadius.circular(Config.cardBorderRadius),
      child: Material(
        borderRadius: BorderRadius.circular(Config.cardBorderRadius),
        elevation: 2,
        child: Ink(
          decoration: BoxDecoration(
            gradient: isChecked
                ? Config.activeFilterGradient
                : Config.inactiveFilterGradient,
            borderRadius: BorderRadius.circular(Config.cardBorderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Config.md,
              horizontal: Config.xs,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                SvgPicture.asset(
                  widget.foodBadge.iconPath,
                  height: Config.iconHeight,
                ),
                const SizedBox(
                  height: Config.md,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.foodBadge.name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 43, 32, 1),
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: .1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
