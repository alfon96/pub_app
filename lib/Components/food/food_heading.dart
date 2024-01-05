import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:app/Components/config/config.dart';

class FoodHeading extends StatelessWidget {
  const FoodHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveGridCol(xs: 12, child: const SizedBox(height: Config.xl)),
        ResponsiveGridCol(
          xs: 12,
          child: const Text(
            'Food',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.w900,
              color: Colors.amber,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        ResponsiveGridCol(
          xs: 12,
          child: const Text(
            'Use filters to match your diet',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13.0,
              color: Color.fromARGB(255, 104, 89, 60),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        ResponsiveGridCol(xs: 12, child: const SizedBox(width: 10)),
        ResponsiveGridCol(xs: 12, child: const SizedBox(height: Config.xl)),
      ],
    );
  }
}
