import 'package:app/Components/food/food_card/food_card.dart';
import 'package:app/models/food.dart';
import 'package:flutter/material.dart';

class Beer extends StatelessWidget {
  const Beer({super.key});

  @override
  Widget build(BuildContext context) {
    final double scale = 1;
    final double xOffset = scale * (0.518) * 100;
    final double yOffset = (0.434);

    FoodData example = FoodData(
      id: 'dvd',
      name: "Pizza Margherita",
      price: 7.99,
      description: "Classic Italian pizza with fresh mozzarella and basil.",
      keywords: ["Italian", "Cheese", "Basil", "Vegetarian"],
      imagePreview:
          "https://images.unsplash.com/photo-1579631542720-3a87824fff86?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BhZ2hldHRpJTIwYmFjb258ZW58MHx8MHx8fDA%3D",
      images: [],
      foodBeverage: false,
      xOffset: xOffset,
      yOffset: yOffset,
      scale: scale,
    );

    return Center(
        child: FoodCard(
      foodData: example,
    ));
  }
}
