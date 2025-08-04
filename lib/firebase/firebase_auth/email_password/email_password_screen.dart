import 'package:demo/firebase/firebase_auth/email_password/auth.dart';
import 'package:demo/firebase/firebase_auth/email_password/home_page.dart';
import 'package:demo/firebase/firebase_auth/email_password/login_register_screen.dart';
import 'package:flutter/material.dart';

class EmailPasswordScreen extends StatefulWidget {
  const EmailPasswordScreen({super.key});

  @override
  State<EmailPasswordScreen> createState() => _EmailPasswordScreenState();
}

class _EmailPasswordScreenState extends State<EmailPasswordScreen> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginRegisterScreen();
        }
      },
    );
  }
}
