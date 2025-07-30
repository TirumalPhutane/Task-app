import 'package:flutter/material.dart';

class DateOperationsDemoScreen extends StatelessWidget {
  DateOperationsDemoScreen({super.key});

  final DateTime today = DateTime.now();
  final DateTime birthdate = DateTime(1999, 3, 1);

  @override
  Widget build(BuildContext context) {
    final int epoch = DateTime(1970, 1, 1, 5, 30).millisecondsSinceEpoch;
    final int currentMillis = today.millisecondsSinceEpoch;
    final int birthMillis = birthdate.millisecondsSinceEpoch;

    final DateTime addedDuration = today.add(Duration(days: 30));
    final DateTime subtractedDuration = today.subtract(Duration(days: 30));

    return Scaffold(
      appBar: AppBar(
        title: Text("Date & Time Operations"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text("📅 Today's Date: $today\n"),
            Text("🎂 Birthdate: $birthdate\n"),
            Text("🕰 Epoch (1970-01-01): $epoch ms\n"),
            Text("⏱ Current time in milliseconds: $currentMillis\n"),
            Text("🎉 Birthdate in milliseconds: $birthMillis\n"),
            Text("➕ 30 days from today: $addedDuration\n"),
            Text("➖ 30 days before today: $subtractedDuration\n"),
          ],
        ),
      ),
    );
  }
}
