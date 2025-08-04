import 'package:demo/navigation/route_names.dart';
import 'package:demo/theme_management/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> signInWithPhone() async {
    try {
      setState(() {
        isLoading = true;
      });

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otpController.text,
      );

      UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, RouteNames.phoneAuthHomeScreen);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Otp Screen')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Image.asset('assets/images/firebase.png', scale: 2.5),
                const Text(
                  "We have sent an OTP to your phone. Please verify",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: AppColors.black),
                ),
                TextField(
                  //obscureText: true,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  controller: _otpController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    fillColor: AppColors.gray.withValues(alpha: 0.2),
                    filled: true,
                    hintText: 'Enter Otp',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: signInWithPhone,
                  child: isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(AppColors.white),
                          strokeWidth: 3,
                          constraints: BoxConstraints.tight(Size(16, 16)),
                        )
                      : Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
