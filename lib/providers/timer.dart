import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerData {
  int target;
  bool finished;

  TimerData({
    required this.target,
    required this.finished,
  });
}

class TimerNotifier extends StateNotifier<TimerData> {
  Timer? _timer;

  TimerNotifier()
      : super(TimerData(
          finished: true,
          target: 10,
        ));

  void startTimer() {
    _timer?.cancel();
    state = TimerData(finished: false, target: state.target);
    _timer = Timer(Duration(seconds: state.target), () {
      state = TimerData(finished: true, target: state.target);
    });
  }

  void setTarget(int target) {
    state = TimerData(finished: state.finished, target: target);
  }

  void resetTimer() {
    _timer?.cancel();
    state = TimerData(finished: false, target: state.target);
  }

  void restartTimer() {
    resetTimer();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, TimerData>((ref) {
  return TimerNotifier();
});
