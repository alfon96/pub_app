import 'package:app/models/food.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodData});
  final FoodData foodData;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    double sizeFilterIcons = 25;
    Container? mealTypeBadge() {
      String badgePath = "";
      if (foodData.keywords.contains("Vegan")) {
        badgePath = veganBadge;
      } else if (foodData.keywords.contains("Vegetarian")) {
        badgePath = vegetarianBadge;
      } else if (foodData.keywords.contains("Fish")) {
        badgePath = fishBadge;
      } else if (foodData.keywords.contains("Meat")) {
        badgePath = meatBadge;
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
        child: Column(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
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
                        width: double.infinity,
                        height: double.infinity,
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
                                foodNotFoundPlaceholderImage,
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
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
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
                    Divider(
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
