import 'package:demo/navigation/route_names.dart';
import 'package:demo/theme_management/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberAuthScreen extends StatefulWidget {
  const PhoneNumberAuthScreen({super.key});

  @override
  State<PhoneNumberAuthScreen> createState() => _PhoneNumberAuthScreenState();
}

class _PhoneNumberAuthScreenState extends State<PhoneNumberAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isloading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> getOtp() async {
    setState(() {
      isloading = true;
    });

    await auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        final userCred = await auth.signInWithCredential(credential);
        if (userCred.user != null) {
          Navigator.pushNamed(context, RouteNames.phoneAuthHomeScreen);
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          isloading = false;
        });
        Navigator.pushNamed(
          context,
          RouteNames.otpScreen,
          arguments: verificationId,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Auto retrieval timeout');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Authentication')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/firebase.png', scale: 2.5),
                Text(
                  'Phone Number Authentication',
                  style: TextStyle(
                    color: AppColors.firebase,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    fillColor: AppColors.gray.withValues(alpha: 0.2),
                    filled: true,
                    hintText: 'Enter Phone',
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
                  onPressed: getOtp,
                  child: isloading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(AppColors.white),
                          strokeWidth: 3,
                          constraints: BoxConstraints.tight(Size(16, 16)),
                        )
                      : Text('Get Otp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
