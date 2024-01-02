import 'package:app/Components/UI/scrollable_wrapper/scrollable_wrapper.dart';
import 'package:app/Components/food/food_card/food_card_img.dart';
import 'package:app/Components/food/food_card/food_card_text.dart';
import 'package:app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key, required this.foodData});
  final FoodData foodData;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  double dragPosition = 0.0;
  bool showLeftColor = false;
  bool showRightColor = false;

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;
    // Compare width and height
    double largerDimension = screenSize.width > screenSize.height
        ? screenSize.width
        : screenSize.height;
    Color bkgColors = Colors.white;
    double imageHeight = largerDimension / 5;

    return ScrollableWrapper(
      child: Card(
        // key: Key(widget.foodData.id),
        elevation: 5,
        borderOnForeground: true,
        surfaceTintColor: bkgColors,
        child: SizedBox(
          child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveGridCol(
                  xs: 6,
                  child: FoodCardImage(
                    foodData: widget.foodData,
                    imageHeight: imageHeight,
                  )),
              ResponsiveGridCol(
                xs: 6,
                child: FoodCardText(
                  foodData: widget.foodData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
