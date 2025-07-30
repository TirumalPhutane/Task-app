import 'package:flutter/material.dart';

class SnackbarDemoScreen extends StatelessWidget {
  const SnackbarDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("SnackBar Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            const snackBarDemo = SnackBar(
              content: Text("Welcome to Flutter!"),
              backgroundColor: Colors.deepPurple,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(5),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBarDemo);
          },
          child: const Text("Click here"),
        ),
      ),
    );
  }
}
