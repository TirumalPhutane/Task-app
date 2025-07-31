import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Screen')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text('Welcome! You have successfully navigated!'),
        ),
      ),
    );
  }
}
