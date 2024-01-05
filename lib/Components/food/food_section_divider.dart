import 'package:flutter/material.dart';
import 'package:app/Components/config/config.dart';

class FoodSectionDivider extends StatelessWidget {
  const FoodSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: Config.xl),
      child: Divider(
        thickness: Config.dividerThickness,
        color: Color.fromARGB(255, 71, 8, 126),
      ),
    );
  }
}
