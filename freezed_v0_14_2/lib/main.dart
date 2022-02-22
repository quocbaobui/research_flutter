import 'package:flutter/material.dart';
import 'package:freezed_v0_14_2/models/user_internal.dart';

import 'models_freezed/user_internal_w.dart';

void main() {
  UserInternal userInternal1 = UserInternal(userId: 0, name: "Bao Test1");
  UserInternal userInternal2 = UserInternal(userId: 0, name: "Bao Test1");
  UserInternal userInternal3 = UserInternal(userId: 0, name: "Bao Test2");

  UserInternalWF userInternalWF1 = UserInternalWF(userId: 0, name: "Bao Test1");
  UserInternalWF userInternalWF2 = UserInternalWF(userId: 1, name: "Bao Test1");
  UserInternalWF userInternalWF3 = UserInternalWF(userId: 0, name: "Bao Test2");

  if (userInternal2 == userInternal2) {
    //Return false
  }
  userInternal1.name = "Change Name";
  print(userInternal1);

  if (userInternalWF1 == userInternalWF2) {
    //Return true
  }

  userInternalWF1.toString();

  // userInternalWF1.name = "Change Name";
  userInternalWF1 = userInternalWF1.copyWith(name: "Change Name");

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
