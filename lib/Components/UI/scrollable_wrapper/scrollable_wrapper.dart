import 'package:app/Components/UI/scrollable_wrapper/scrollable_wrapper_background.dart';
import 'package:app/Components/config/shared_functions.dart';
import 'package:flutter/material.dart';

class ScrollableWrapper extends StatefulWidget {
  const ScrollableWrapper({super.key, required this.child});
  final Widget child;
  @override
  State<ScrollableWrapper> createState() => _ScrollableWrapperState();
}

class _ScrollableWrapperState extends State<ScrollableWrapper> {
  double dragPosition = 0.0;
  bool showLeftColor = false;
  bool showRightColor = false;
  double scrollLimit = 100.0;

  void handleDragUpdate(details) {
    setState(() {
      dragPosition =
          (dragPosition + details.delta.dx).clamp(-scrollLimit, scrollLimit);
    });
  }

  void handleDragEnd(details) {
    String message = "";
    bool rightColor = false; // Inizializza a false
    bool leftColor = false; // Inizializza a false

    if (dragPosition >= scrollLimit) {
      message = "Aggiunto al carrello";
      rightColor = true;
    } else if (dragPosition <= -scrollLimit) {
      message = "Rimosso dal carrello";
      leftColor = true;
    }

    if (message != "") {
      showSnackbar(context, message);
    }

    setState(() {
      showRightColor = rightColor;
      showLeftColor = leftColor;
      dragPosition = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Left Background
      ScrollableWrapperBackground(
        dragPosition: dragPosition,
        isLeft: true,
        scrollLimit: -scrollLimit,
      ),
      // Right Background
      ScrollableWrapperBackground(
        dragPosition: dragPosition,
        isLeft: false,
        scrollLimit: scrollLimit,
      ),

      GestureDetector(
        onHorizontalDragUpdate: handleDragUpdate,
        onHorizontalDragEnd: handleDragEnd,
        child: Transform.translate(
          offset: Offset(dragPosition, 0),
          child: widget.child,
        ),
      ),
    ]);
  }
}
