import 'package:app/models/food.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCardImage extends StatelessWidget {
  const FoodCardImage(
      {super.key, required this.foodData, required this.imageHeight});
  final FoodData foodData;
  final double imageHeight;
  final double sizeFilterIcons = 25;
  final double iconSpace = 5;
  final Color bkgNoImageFound = const Color.fromARGB(255, 247, 243, 255);

  List<Widget> mealTypeBadges() {
    List<Widget> badges = [];

    for (var filterBadge in foodFilters) {
      if (foodData.keywords.contains(filterBadge.name)) {
        badges.add(
          Container(
            height: sizeFilterIcons,
            width: sizeFilterIcons,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(filterBadge.iconPath),
          ),
        );
      }
    }

    return badges; // Restituisce l'elenco dei widget badge
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
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),
                errorWidget: (context, url, error) => Container(
                  color: bkgNoImageFound,
                  child: Stack(alignment: Alignment.center, children: [
                    SvgPicture.asset(
                      foodNotFoundPlaceholderImage.iconPath,
                      fit: BoxFit.scaleDown,
                    ),
                    const Text(
                      "👨‍🍳\nSorry! The image not available. But I'm sure it's delicious ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11.5, fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: iconSpace,
                direction: Axis.horizontal,
                children: mealTypeBadges(),
              ),
            )
          ]),
    );
  }
}
