import 'package:demo/firebase/firebase_auth/email_password/auth.dart';
import 'package:demo/theme_management/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signout() async {
    await Auth().signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Authentication')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Image.asset('assets/images/firebase.png', scale: 2.5),
              Text(
                user?.email != null ? 'Hello, ${user!.email}' : 'User Email',
                style: TextStyle(
                  color: AppColors.firebase,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(onPressed: signout, child: Text('Sign Out')),
            ],
          ),
        ),
      ),
    );
  }
}
