import 'package:app/Components/UI/animations/shaking_wrapper.dart';
import 'package:app/Components/config/config.dart';
import 'package:app/models/cart.dart';
import 'package:app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingCartButton extends ConsumerWidget {
  const FloatingCartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CartItem> items = ref.watch(cartProvider).items;

    int getTotalNumberOdItemsInCart() {
      int numItemsInCart = 0;
      for (CartItem item in items) {
        numItemsInCart += item.quantity;
      }

      return numItemsInCart;
    }

    return Positioned(
      bottom: Config.xl,
      right: Config.md,
      child: ShakingWrapper(
        child: Stack(clipBehavior: Clip.none, children: [
          FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset(Config.cartIconPath),
          ),
          if (items.isNotEmpty)
            Positioned(
              top: -5,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    getTotalNumberOdItemsInCart().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ]),
      ),
    );
  }
}
