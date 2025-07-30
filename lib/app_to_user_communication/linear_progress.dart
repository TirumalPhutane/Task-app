import 'dart:async';

import 'package:flutter/material.dart';

class LinearProgressDemoScreen extends StatefulWidget {
  const LinearProgressDemoScreen({super.key});

  @override
  State<LinearProgressDemoScreen> createState() => _LinearProgressDemoState();
}

class _LinearProgressDemoState extends State<LinearProgressDemoScreen> {
  double progress = 0.0;
  bool _isLoaded = false;

  void updateProgress(double value) {
    setState(() {
      progress = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linear Progress Indicator"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (progress > 0) {
                          updateProgress(progress - 0.1);
                        }
                      },
                      child: Text("Decrease"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (progress < 1.0) {
                          updateProgress(progress + 0.1);
                        }
                      },
                      child: Text("Increase"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updateProgress(0.0);
                      },
                      child: Text("Reset"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _isLoaded
                    ? Text(
                        "Loaded Successfully!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
