import 'package:app/models/food.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodData});
  final FoodData foodData;

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    double sizeFilterIcons = 25;
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

    return Card(
        color: Colors.amber,
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 12,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Stack(
                    alignment: Alignment.topLeft,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 5,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: foodData.imagePreview,
                          placeholder: (context, url) => const SizedBox(
                              height: 30,
                              width: 30,
                              child: Center(
                                child: CircularProgressIndicator(),
                              )),
                          errorWidget: (context, url, error) =>
                              Column(children: [
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
              ),
            ),
            ResponsiveGridCol(
              xs: 12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      foodData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 56, 42, 1),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Text(
                      foodData.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 32, 24, 1),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
