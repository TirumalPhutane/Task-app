import 'package:demo/firebase/firebase_auth/email/auth_service.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleScreen extends StatefulWidget {
  const SignInWithGoogleScreen({super.key});

  @override
  State<SignInWithGoogleScreen> createState() => _SignInWithGoogleScreenState();
}

class _SignInWithGoogleScreenState extends State<SignInWithGoogleScreen> {
  final AuthService _authService = AuthService();
  bool _loading = false;

  Future<void> _handleSignIn() async {
    setState(() => _loading = true);
    try {
      final userCred = await _authService.signInWithGoogle();
      if (userCred != null) {
        final user = userCred.user;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed in as ${user?.displayName}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-in aborted by user')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign-in failed: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _handleSignOut() async {
    await _authService.signOut();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;
    return Scaffold(
      appBar: AppBar(title: Text('Google Sign in')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : user == null
            ? ElevatedButton.icon(
                onPressed: _handleSignIn,
                icon: const Icon(Icons.login),
                label: const Text('Sign in with Google'),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (user.photoURL != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: 40,
                    ),
                  const SizedBox(height: 8),
                  Text('Name: ${user.displayName}'),
                  Text('Email: ${user.email}'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _handleSignOut,
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
      ),
    );
  }
}
