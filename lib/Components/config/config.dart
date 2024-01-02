import 'package:flutter/material.dart';

class Config {
  // Generic constants
  static const double xs = 2;
  static const double sm = 4;
  static const double md = 8;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double dividerThickness = 0.3;
  // Generic Cards Constants
  static const double cardBorderRadius = 15.0;

  // Food Cards
  static const String leftArrowPath = "assets/general_icons/left.svg";
  static const String rightArrowPath = "assets/general_icons/right.svg";
  static const String cartIconPath = "assets/cart_icons/cart.svg";

  // Filter Cards Constants
  static const double iconHeight = 25.0;
  static const Color splashColorFilterCard = Color.fromARGB(148, 255, 237, 188);
  static const LinearGradient activeFilterGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 255, 241, 200),
      Color.fromARGB(255, 253, 246, 225),
      Color.fromARGB(255, 255, 255, 255),
    ],
  );
  static const LinearGradient inactiveFilterGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 255, 255, 255),
    ],
  );
}
