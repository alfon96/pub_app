import 'package:app/Components/appbar/action-items/action_circle.dart';
import 'package:app/models/screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 247, 193, 18),
      child: SafeArea(
        child: AppBar(
            toolbarHeight: kToolbarHeight,
            flexibleSpace: Container(
              height: kToolbarHeight,
              color: const Color.fromARGB(255, 247, 193, 18),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ActionCircle(targetScreen: beerScreen),
                    ),
                    const SizedBox(width: 10), // Gap di 10 pixel
                    Align(
                      alignment: Alignment.center,
                      child: ActionCircle(targetScreen: foodScreen),
                    ),
                    const SizedBox(width: 10), // Gap di 10 pixel
                    Align(
                      alignment: Alignment.center,
                      child: ActionCircle(targetScreen: musicScreen),
                    ),
                  ]),
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
