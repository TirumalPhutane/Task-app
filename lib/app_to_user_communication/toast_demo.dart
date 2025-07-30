import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastDemoScreen extends StatefulWidget {
  const ToastDemoScreen({super.key});

  @override
  State<ToastDemoScreen> createState() => _ToastDemoState();
}

class _ToastDemoState extends State<ToastDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Toast Demo"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'Welcome to flutter!',
              toastLength: Toast.LENGTH_SHORT, // Duration of the toast
              gravity: ToastGravity.BOTTOM, // Position on screen
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Colors.black,
              fontSize: 16.0,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.all(14),
            //color: Colors.green,
            child: const Text(
              'Show Toast',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
