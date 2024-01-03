import 'package:app/Components/UI/scrollable_wrapper/scrollable_wrapper.dart';
import 'package:app/Components/food/food_card/food_card_img.dart';
import 'package:app/Components/food/food_card/food_card_text.dart';
import 'package:app/models/cart.dart';
import 'package:app/models/food.dart';
import 'package:app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FoodCard extends ConsumerStatefulWidget {
  const FoodCard({super.key, required this.foodData});
  final FoodData foodData;

  @override
  ConsumerState<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends ConsumerState<FoodCard> {
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

    CartItem thisItem = CartItem(
      id: widget.foodData.name,
      price: widget.foodData.price,
      quantity: 1,
    );

    return ScrollableWrapper(
      onLeftDrag: () {
        ref.read(cartProvider.notifier).removeItem(thisItem);
      },
      onRightDrag: () {
        ref.read(cartProvider.notifier).addItem(thisItem);
      },
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
