import 'package:app/Components/cart/floating_cart_button.dart';
import 'package:app/Components/food/food_assemble.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FoodAssemble(),
        FloatingCartButton(),
      ],
    );
  }
}
