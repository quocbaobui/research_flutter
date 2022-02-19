import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/my_class.dart';

// final classAStateProvider = StateProvider<ClassTestA>((ref) => ClassTestA());

ChangeNotifierProvider<ClassTestAChangeNotifer> classAChangeNotifierProvider =
    ChangeNotifierProvider<ClassTestAChangeNotifer>(
        (ref) => ClassTestAChangeNotifer());

class MyAppRiverpodEx2StateProvider extends ConsumerWidget {
  const MyAppRiverpodEx2StateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(" Flutter RiverPod Ex2")),
      body: Center(
          child: Text(
              "Your name: ${ref.watch(classAChangeNotifierProvider).getName}")),
      floatingActionButton: FloatingActionButton(
        child: Text("Name"),
        onPressed: () {
          ref.read(classAChangeNotifierProvider).setName("Nguyen van Toan");
        },
      ),
    );
  }
}
