import 'package:demo/navigation/route_names.dart';
import 'package:flutter/material.dart';

class FirebaseAuthScreen extends StatelessWidget {
  const FirebaseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> authentications = [
      'Email and Password',
      'Google',
      'Phone Number',
      'Facebook',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Firebase Authentication')),
      body: ListView.builder(
        itemCount: authentications.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, getScreenForList(index));
            },
            child: Card(
              elevation: 3.0,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListTile(
                key: ValueKey(index),
                //leading: const Icon(Icons.list),
                trailing: const Icon(Icons.keyboard_arrow_right),
                title: Text(
                  authentications[index],
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

String getScreenForList(int index) {
  switch (index) {
    case 0:
      return RouteNames.emailPasswordScreen;
    case 1:
      return RouteNames.signInWithGoogleScreen;
    case 2:
      return RouteNames.phoneNumberAuthScreen;
    case 3:
      return RouteNames.emailPasswordScreen;
  }
  return "";
}
