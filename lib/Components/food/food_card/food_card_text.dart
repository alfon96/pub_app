import 'package:app/models/food.dart';
import 'package:flutter/material.dart';

class FoodCardText extends StatelessWidget {
  const FoodCardText({super.key, required this.foodData});
  final FoodData foodData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            foodData.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17.0,
              color: Color.fromARGB(255, 245, 189, 21),
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Color.fromARGB(255, 71, 8, 126),
          ),
          Text(
            foodData.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11.0,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 71, 8, 126),
            ),
          ),
          Text(
            "${foodData.price.toString()} €",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 71, 8, 126),
            ),
          ),
        ],
      ),
    );
  }
}
