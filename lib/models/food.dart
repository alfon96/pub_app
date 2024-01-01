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

class FoodFilterBadge {
  String name;
  String iconPath;

  FoodFilterBadge({
    required this.name,
    required this.iconPath,
  });
}

class FoodProviderData {
  List<FoodData> completeMenu;
  List<FoodData> filteredMenu;
  List<String> activeFilters;

  FoodProviderData({
    required this.completeMenu,
    required this.filteredMenu,
    required this.activeFilters,
  });
}

FoodFilterBadge veganBadge = FoodFilterBadge(
  name: 'Vegan',
  iconPath: "assets/food_icons/vegan.svg",
);
FoodFilterBadge vegetarianBadge = FoodFilterBadge(
  name: 'Vegetarian',
  iconPath: "assets/food_icons/vegetarian.svg",
);
FoodFilterBadge fishBadge = FoodFilterBadge(
  name: 'Fish',
  iconPath: "assets/food_icons/fish.svg",
);
FoodFilterBadge meatBadge = FoodFilterBadge(
  name: 'Meat',
  iconPath: "assets/food_icons/meat.svg",
);
FoodFilterBadge noGlutenBadge = FoodFilterBadge(
  name: 'No Gluten',
  iconPath: "assets/food_icons/no_gluten.svg",
);
FoodFilterBadge noLactoseBadge = FoodFilterBadge(
  name: 'No Lactose',
  iconPath: "assets/food_icons/no_lactose.svg",
);
FoodFilterBadge foodNotFoundPlaceholderImage = FoodFilterBadge(
  name: 'NotFound',
  iconPath: "assets/food_icons/404.svg",
);

List<FoodFilterBadge> foodFilters = [
  veganBadge,
  vegetarianBadge,
  fishBadge,
  meatBadge,
  noGlutenBadge,
  noLactoseBadge
];
