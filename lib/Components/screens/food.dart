import 'package:app/Components/cart/floating_cart_button.dart';
import 'package:app/Components/food/food_assemble.dart';
import 'package:app/providers/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodScreen extends ConsumerWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          ref.read(timerProvider.notifier).restartTimer();
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {
          ref.read(timerProvider.notifier).restartTimer();
        },
        child: const Stack(
          children: [
            FoodAssemble(),
            FloatingCartButton(),
          ],
        ),
      ),
    );
  }
}
