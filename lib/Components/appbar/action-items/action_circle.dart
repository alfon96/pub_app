import 'package:app/Components/appbar/action-items/action_item.dart';
import 'package:app/models/screen.dart';
import 'package:app/providers/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionCircle extends ConsumerWidget {
  const ActionCircle({
    super.key,
    required this.targetScreen,
  });
  final ScreenData targetScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive =
        ref.watch(screensProvider).screenName == targetScreen.screenName;
    return InkWell(
        onTap: () {
          // Aggiungi qui l'azione che vuoi eseguire al tap
          ref
              .read(screensProvider.notifier)
              .changeScreen(targetScreen.screenName);
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click, // Scegli il cursore desiderato qui
          child: Stack(alignment: Alignment.center, children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                ),
                width: isActive ? 90 : 90, // Larghezza definita per il circle
                height: kToolbarHeight / 2,
              ),
            ),
            ActionItem(
              isActive: isActive,
              targetScreen: targetScreen,
            )
          ]),
        ));
  }
}
