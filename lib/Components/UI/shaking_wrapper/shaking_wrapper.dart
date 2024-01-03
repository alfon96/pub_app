import 'package:flutter/material.dart';

class ShakingWrapper extends StatefulWidget {
  const ShakingWrapper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<ShakingWrapper> createState() => _ShakingWrapperState();
}

class _ShakingWrapperState extends State<ShakingWrapper>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final int limitShakes = 2;
  final double maxAngle = 0.025;
  int durationMilliseconds = 100;
  int _shakeCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // Must set the controller's value to 0.5 to avoid the widget
      // starting at the 'begin' position of the animation sequence.
      // Without this setting, even if the animation is not triggered
      // in initState, the widget would initially appear rotated to
      // the 'begin' position.
      value: 0.5,
      duration: Duration(milliseconds: durationMilliseconds),
      vsync: this,
    );
    _setupAnimation();
  }

  void _setupAnimation() {
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: -maxAngle, end: 0),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: maxAngle),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  void _startAnimation() {
    _animation.addStatusListener((status) {
      if (_shakeCount >= limitShakes) {
        _controller.stop();
        _controller.animateTo(0.5,
            duration:
                Duration(milliseconds: (durationMilliseconds ~/ 2).toInt()));
      } else if (status == AnimationStatus.completed) {
        _shakeCount++;
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return RotationTransition(
          turns: _animation,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ShakingWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != oldWidget.child) {
      // Resetta e riavvia l'animazione se il widget child è cambiato
      _controller.reset();
      _setupAnimation();
      _startAnimation();
      _controller.forward();
    }
  }
}
