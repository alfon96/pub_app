import 'package:app/Components/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingCartButton extends StatefulWidget {
  const FloatingCartButton({super.key});

  @override
  State<FloatingCartButton> createState() => _FloatingCartButtonState();
}

class _FloatingCartButtonState extends State<FloatingCartButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32.0,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(Config.cartIconPath),
      ),
    );
  }
}
