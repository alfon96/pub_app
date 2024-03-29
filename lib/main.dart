import 'package:app/Components/appbar/custom_app_bar.dart';
import 'package:app/providers/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScreen = ref.watch(screensProvider);

    return MaterialApp(
      title: 'PubApp',
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: currentScreen.screen,
      ),
      theme: ThemeData(fontFamily: 'Raleway'),
    );
  }
}
