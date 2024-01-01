import 'package:app/models/food.dart';

FoodData pizza = FoodData(
  name: "Pizza Margherita",
  price: 7.99,
  description: "Classic Italian pizza with fresh mozzarella and basil.",
  keywords: ["Italian", "Cheese", "Basil", "Vegetarian"],
  imagePreview:
      "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  images: ["assets/pizza1.jpg", "assets/pizza2.jpg"],
);

FoodData burger = FoodData(
  name: "Classic Burger",
  price: 5.99,
  description: "Juicy beef burger with lettuce, tomato and cheese.",
  keywords: ["Beef", "American", "Fast FoodData", "Meat"],
  imagePreview:
      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1299&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  images: ["assets/burger1.jpg", "assets/burger2.jpg"],
);

FoodData sushi = FoodData(
  name: "Salmon Nigiri",
  price: 12.99,
  description:
      "Fresh salmon over seasoned rice, served with wasabi and soy sauce.",
  keywords: ["Japanese", "Fish", "Rice", "Fish"],
  imagePreview:
      "https://images.unsplash.com/photo-1611143669185-af224c5e3252?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  images: ["assets/sushi1.jpg", "assets/sushi2.jpg"],
);

FoodData salad = FoodData(
  name: "Caesar Salad",
  price: 8.99,
  description:
      "Crispy romaine lettuce with Caesar dressing, croutons, and parmesan cheese.",
  keywords: ["Salad", "Healthy", "Greens", "Vegan"],
  imagePreview:
      "https://images.unsplash.com/photo-1547496502-affa22d38842?q=80&w=1277&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  images: ["assets/salad1.jpg", "assets/salad2.jpg"],
);

FoodData pasta = FoodData(
  name: "Spaghetti Carbonara",
  price: 10.99,
  description:
      "Traditional Italian pasta with eggs, cheese, pancetta, and pepper.",
  keywords: ["Pasta", "Italian", "Egg", "Meat"],
  imagePreview:
      "https://images.unsplash.com/photo-1579631542720-3a87824fff86?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BhZ2hldHRpJTIwYmFjb258ZW58MHx8MHx8fDA%3D",
  images: ["assets/pasta1.jpg", "assets/pasta2.jpg"],
);

List<FoodData> menuItems = [pizza, burger, sushi, salad, pasta];
