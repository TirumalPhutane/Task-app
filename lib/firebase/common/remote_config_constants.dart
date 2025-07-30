import 'package:demo/main.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';

String get userName => remoteConfig.getString('name');
int get userAge => remoteConfig.getInt('age');
String get userHobbie => remoteConfig.getString('hobbie');
