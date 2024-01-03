import 'package:app/Components/UI/shaking_wrapper/shaking_wrapper.dart';
import 'package:app/Components/config/config.dart';
import 'package:app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingCartButton extends StatelessWidget {
  const FloatingCartButton({super.key, required this.items});
  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    int getTotalNumberOdItemsInCart() {
      int numItemsInCart = 0;
      for (CartItem item in items) {
        numItemsInCart += item.quantity;
      }

      return numItemsInCart;
    }

    return Positioned(
      bottom: 32.0,
      right: 16.0,
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
