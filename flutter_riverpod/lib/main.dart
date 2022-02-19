import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'example.dart';
import 'provider_exp/provider1_example.dart';
import 'provider_exp/provider2_example.dart';
import 'provider_exp/provider3_example.dart';
import 'provider_exp/provider4_example.dart';

/// TODO: Run example Provider
// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Flutter Riverpod',
//       // home: MyAppProviderEx1(),
//       // home: MyAppProviderEx2(),
//       // home: MyAppProviderEx3(),
//       home: MyAppProviderEx4(),
//     ),
//   );
// }

//TO DO Run example Riverpod
void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'Flutter Riverpod',
    home: MyAppRiverpod(),
  )));
}
