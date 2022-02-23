import 'package:flutter/material.dart';
import 'package:freezed_v0_14_2/models/user_internal.dart';

import 'models_freezed/user_internal_w.dart';

void main() {
  UserInternal userInternal1 =
      UserInternal(userId: 0, name: "Bao Test1", age: 8);
  UserInternal userInternal2 =
      UserInternal(userId: 0, name: "Bao Test1", age: 8);
  UserInternal userInternal3 =
      UserInternal(userId: 1, name: "Bao Test2", age: 8);

  UserInternalWF userInternalWF1 =
      UserInternalWF(userId: 0, name: "Bao Test1", age: 8);
  UserInternalWF userInternalWF2 =
      UserInternalWF(userId: 0, name: "Bao Test1", age: 8);
  UserInternalWF userInternalWF3 =
      UserInternalWF(userId: 1, name: "Bao Test2", age: 8);

  //Setter
  print("\n------------ Test Setter/Getter -----------");

  userInternal3.name = "Change userInternal1 Name";
  print(userInternal3.name);

  // userInternalWF1.name = "Change Name";
  userInternalWF3 =
      userInternalWF3.copyWith(name: "Change userInternalWF1 Name");
  print(userInternalWF3.name);

  // compare
  print("\n------------ Test compare -----------");

  print(
      "userInternal1 == userInternal2 return ${userInternal1 == userInternal2}");

  print(
      "userInternalWF1 == userInternalWF2 return ${(userInternalWF1 == userInternalWF2)}");
  print(
      "userInternalWF1 == userInternalWF3 return ${(userInternalWF1 == userInternalWF3)}");

  print("\n------------ Test toString -----------");

  userInternal1.toString();
  print("userInternal1.toString() -> ${userInternal1.toString()}");
  print("userInternalWF1.toString() -> ${userInternalWF1.toString()}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Research Freezed',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Research Freezed'),
          ),
        ));
  }
}
