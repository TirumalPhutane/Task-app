import 'package:flutter/material.dart';

class PhoneAuthHomeScreen extends StatelessWidget {
  const PhoneAuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Auth Home')),
      body: Center(child: Text('Sign In successful!')),
    );
  }
}
