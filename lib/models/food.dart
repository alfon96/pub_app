class FoodData {
  String name;
  double price;
  String description;
  List keywords;
  String imagePreview;
  List<String> images;

  FoodData({
    required this.name,
    required this.price,
    required this.description,
    required this.keywords,
    required this.imagePreview,
    required this.images,
  });
}

const String veganBadge = "assets/food_icons/vegan.svg";
const String vegetarianBadge = "assets/food_icons/vegetarian.svg";
const String fishBadge = "assets/food_icons/fish.svg";
const String meatBadge = "assets/food_icons/meat.svg";
const String foodNotFoundPlaceholderImage = "assets/food_icons/404.svg";
