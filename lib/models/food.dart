class FoodData {
  String id;
  String name;
  double price;
  String description;
  List keywords;
  String imagePreview;
  List<String> images;
  bool foodBeverage;

  FoodData({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.keywords,
    required this.imagePreview,
    required this.images,
    required this.foodBeverage,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) {
    return FoodData(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      keywords: json['keywords'],
      imagePreview: json['imgPreview'],
      images: List<String>.from(json['images']),
      foodBeverage: json['food_beverage'],
    );
  }
}

class Menu {
  List<FoodData> items;
  Menu({required this.items});

  factory Menu.fromJson(Map<String, dynamic> json) {
    var itemsJson = json['items'] as List;
    List<FoodData> itemsList =
        itemsJson.map((itemJson) => FoodData.fromJson(itemJson)).toList();
    return Menu(items: itemsList);
  }
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
  Menu completeMenu;
  Menu filteredMenu;
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
  name: 'Gluten Free',
  iconPath: "assets/food_icons/no_gluten.svg",
);
FoodFilterBadge noLactoseBadge = FoodFilterBadge(
  name: 'Lactose Free',
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
