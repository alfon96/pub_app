import 'dart:async';

import 'package:app/providers/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idle_detector_wrapper/idle_detector_wrapper.dart';

// Definizione di TranslationAnimator come StatefulWidget
class TranslationAnimator extends ConsumerStatefulWidget {
  const TranslationAnimator({
    super.key,
    required this.child,
    required this.displacement,
    required this.initialDelay,
    required this.inactiveDelay,
  });

  final Widget child;
  final double displacement;
  final int initialDelay;
  final int inactiveDelay;
  @override
  ConsumerTranslationAnimatorState createState() =>
      ConsumerTranslationAnimatorState();
}

class ConsumerTranslationAnimatorState
    extends ConsumerState<TranslationAnimator> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _initialAnimation;
  late Animation<Offset> _continuousAnimation;
  Timer? _initialAnimationTimer;
  bool _isInitialAnimationCompleted = false;
  bool _isInLoopAnimation = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    // Definizione delle animazioni
    _initialAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(widget.displacement, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));

    _continuousAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(widget.displacement / 4, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));

    // Ascoltatore dello stato dell'animazione
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          !_isInitialAnimationCompleted) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed &&
          !_isInitialAnimationCompleted) {
        _isInitialAnimationCompleted = true;
        ref.read(timerProvider.notifier).setTarget(widget.inactiveDelay);
        ref.read(timerProvider.notifier).startTimer();
      }
    });

    _startInitialAnimation();
  }

  void _startInitialAnimation() {
    _initialAnimationTimer?.cancel();
    _initialAnimationTimer =
        Timer(Duration(milliseconds: widget.initialDelay), () {
      if (!_isInitialAnimationCompleted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _initialAnimationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool timerFinished = ref.watch(timerProvider).finished;

    if (timerFinished && _isInitialAnimationCompleted && !_isInLoopAnimation) {
      _controller.repeat(reverse: true); // Avvia l'animazione continua
      setState(() {
        _isInLoopAnimation = true;
      });
    }

    if (_isInLoopAnimation && !timerFinished) {
      _controller.animateBack(0.0, duration: const Duration(milliseconds: 200));
      setState(() {
        _isInLoopAnimation = false;
      });
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _isInitialAnimationCompleted
              ? _continuousAnimation.value
              : _initialAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
