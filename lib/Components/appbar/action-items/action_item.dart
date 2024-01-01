import 'package:app/models/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionItem extends ConsumerWidget {
  const ActionItem({
    super.key,
    required this.isActive,
    required this.targetScreen,
  });
  final bool isActive;
  final ScreenData targetScreen;
  static const Color inactiveColor = Color.fromARGB(255, 245, 245, 245);
  static const Color activeColor = Color.fromARGB(255, 255, 255, 255);
  static const double width = 50.0;
  static const double iconSize = 35;
  static const double widthTransparentContainers = 25.0;
  static const double height = 80.0;
  static const Color appBarBackground = Color.fromARGB(255, 247, 193, 18);
  static const double borderRadiusTransparentElements = 20.0;

  BoxDecoration boxDecorationTransparentItems({
    bool isRight = false,
  }) {
    BorderRadius borders = !isActive
        ? BorderRadius.zero
        : BorderRadius.only(
            bottomLeft: isRight
                ? const Radius.circular(borderRadiusTransparentElements)
                : Radius.zero,
            bottomRight: isRight
                ? Radius.zero
                : const Radius.circular(borderRadiusTransparentElements),
          );

    return BoxDecoration(color: appBarBackground, borderRadius: borders);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widthTransparentContainers, // Larghezza definita per il circle
          height: height, // Altezza definita per il circle

          decoration: boxDecorationTransparentItems(isRight: false),
        ),
        Container(
            color: const Color.fromARGB(0, 33, 149, 243),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: isActive ? activeColor : inactiveColor,
                shape: BoxShape.circle,
                boxShadow: null,
              ),
              child: Center(
                child: targetScreen.pathIcon != ''
                    ? SizedBox(
                        width: iconSize,
                        height: iconSize,
                        child: SvgPicture.asset(
                          targetScreen.pathIcon!,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    : Text(targetScreen.screenName),
              ),
            )),
        Container(
          width: widthTransparentContainers,
          height: height,
          decoration: boxDecorationTransparentItems(isRight: true),
        )
      ],
    );
  }
}
