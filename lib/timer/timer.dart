import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 0;
  Timer? _timer;
  bool _isTimerRunning = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    if (_isTimerRunning) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });

    setState(() {
      _isTimerRunning = true;
    });
  }

  void pauseTimer() {
    _timer?.cancel();

    setState(() {
      _isTimerRunning = false;
    });
  }

  void resetTimer() {
    _timer?.cancel();

    setState(() {
      _seconds = 0;
      _isTimerRunning = false;
    });
  }

  String getFormattedTime() {
    int hours = _seconds ~/ 3600;
    int minutes = (_seconds % 3600) ~/ 60;
    int seconds = _seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = getFormattedTime();

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Counter"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(formattedTime, style: TextStyle(fontSize: 48)),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isTimerRunning ? pauseTimer : startTimer,
                  child: Text(_isTimerRunning ? 'Pause' : 'Start'),
                ),
                SizedBox(width: 15),
                ElevatedButton(onPressed: resetTimer, child: Text("Reset")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class MyCountdownTimer extends StatelessWidget {
//   const MyCountdownTimer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Countdown Timer')),
//       body: Center(
//         child: TimerCountdown(
//           format: CountDownTimerFormat.minutesSeconds,
//           endTime: DateTime.now().add(const Duration(minutes: 1)),
//           onEnd: () => print('Timer finished'),
//         ),
//       ),
//     );
//   }
// }

// class CountDownTimerPage extends StatefulWidget {
//   const CountDownTimerPage({super.key});

//   @override
//   State<CountDownTimerPage> createState() => _CountDownTimerPageState();
// }

// class _CountDownTimerPageState extends State<CountDownTimerPage> {
//   Timer? _timer;
//   int _remainingSeconds;

//   _CountDownTimerPageState({int startSeconds = 10})
//     : _remainingSeconds = startSeconds;

//   void _startCountdown() {
//     const oneSecond = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSecond, (Timer timer) {
//       if (_remainingSeconds <= 0) {
//         setState(() {
//           timer.cancel();
//         });
//       } else {
//         setState(() {
//           _remainingSeconds--;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Simple Countdown timer"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Text('$_remainingSeconds', style: TextStyle(fontSize: 48)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _startCountdown,
//         tooltip: 'Start Countdown',
//         child: Icon(Icons.timer),
//       ),
//     );
//   }
// }
