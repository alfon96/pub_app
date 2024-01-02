import 'package:app/models/food.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCardImage extends StatelessWidget {
  const FoodCardImage(
      {super.key, required this.foodData, required this.imageHeight});
  final FoodData foodData;
  final double imageHeight;
  final double sizeFilterIcons = 35;

  Container? mealTypeBadge() {
    String badgePath = "";
    if (foodData.keywords.contains("Vegan")) {
      badgePath = veganBadge.iconPath;
    } else if (foodData.keywords.contains("Vegetarian")) {
      badgePath = vegetarianBadge.iconPath;
    } else if (foodData.keywords.contains("Fish")) {
      badgePath = fishBadge.iconPath;
    } else if (foodData.keywords.contains("Meat")) {
      badgePath = meatBadge.iconPath;
    }

    if (badgePath != '') {
      return Container(
        height: sizeFilterIcons,
        width: sizeFilterIcons,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(badgePath),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        topLeft: Radius.circular(10.0),
      ),
      child: Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.hardEdge,
          children: [
            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: foodData.imagePreview,
                placeholder: (context, url) => const SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),
                errorWidget: (context, url, error) => Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      foodNotFoundPlaceholderImage.iconPath,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const Text(
                    "Sorry! Meal's Image not found.",
                    style: TextStyle(fontSize: 11.0),
                  ),
                ]),
                fit: BoxFit.cover,
              ),
            ),
            if (mealTypeBadge() != null)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [mealTypeBadge()!],
                ),
              )
          ]),
    );
  }
}
