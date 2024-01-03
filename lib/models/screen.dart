import 'package:app/Components/screens/beer.dart';
import 'package:app/Components/screens/food.dart';
import 'package:app/Components/screens/home.dart';
import 'package:app/Components/screens/music.dart';
import 'package:flutter/cupertino.dart';

class ScreenData {
  String screenName;
  String? pathIcon;
  Widget screen;

  ScreenData({
    required this.screenName,
    required this.pathIcon,
    required this.screen,
  });
}

// Screens Data
ScreenData beerScreen = ScreenData(
  screenName: 'Beer',
  pathIcon: 'assets/action_icons/beer.svg',
  screen: const Beer(),
);

ScreenData foodScreen = ScreenData(
  screenName: 'Food',
  pathIcon: 'assets/action_icons/food.svg',
  screen: const FoodScreen(),
);

ScreenData musicScreen = ScreenData(
  screenName: 'Music',
  pathIcon: 'assets/action_icons/music.svg',
  screen: const Music(),
);

ScreenData homeScreen = ScreenData(
  screenName: 'Home',
  pathIcon: '',
  screen: const Home(),
);
