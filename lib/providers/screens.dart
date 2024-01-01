import 'package:app/Components/screens/home.dart';
import 'package:app/models/screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreensNotifier extends StateNotifier<ScreenData> {
  ScreensNotifier()
      : super(ScreenData(
          screenName: 'Home',
          pathIcon: 'path/to/home/icon',
          screen: const Home(),
        ));

  ScreenData getScreenData(String screenName) {
    if (screenName == 'Food') {
      return foodScreen;
    } else if (screenName == 'Music') {
      return musicScreen;
    } else if (screenName == 'Beer') {
      return beerScreen;
    } else {
      return homeScreen;
    }
  }

  void changeScreen(String screenName) {
    final ScreenData screen = getScreenData(screenName);

    state = screen;
  }

  String getCurrentScreenName() {
    return state.screenName;
  }
}

final screensProvider = StateNotifierProvider<ScreensNotifier, ScreenData>(
    (ref) => ScreensNotifier());
