import 'package:demo/hive_database/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
  static final userBox = Hive.box(userHiveBox);

  //Create
  static createUser(Map data) {
    userBox.add(data);
  }

  static addAllUser(List data) {
    userBox.addAll(data);
  }

  //Read
  static List getAllUsers() {
    final data = userBox.keys.map((key) {
      final value = userBox.get(key);
      return {"key": key, "name": value["name"], "email": value["email"]};
    }).toList();

    return data.toList();
  }

  static Map getUser(int key) {
    return userBox.get(key);
  }

  //Update
  static updateUser(int key, Map data) {
    userBox.put(key, data);
  }

  //Delete
  static deleteUser(int key) {
    return userBox.delete(key);
  }

  static deleteAllUsers() {
    return userBox.deleteAll(userBox.keys);
  }
}
