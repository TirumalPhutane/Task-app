import 'package:flutter/material.dart';

class FirebaseScreen extends StatelessWidget {
  const FirebaseScreen({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          message == null ? Text('') : Text(message),
          ElevatedButton(
            onPressed: () => throw Exception(),
            child: const Text("Throw Test Exception"),
          ),
        ],
      ),
    );
  }
}
