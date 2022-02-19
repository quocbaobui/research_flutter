import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/my_class.dart';

Provider<ClassTestA> classAProvider =
    Provider<ClassTestA>((ref) => ClassTestA());

class MyAppRiverpodEx1Comsumer extends StatelessWidget {
  const MyAppRiverpodEx1Comsumer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Lay du lieu tu classA
    return Consumer(
      builder: (context1, ref, child) {
        String _name = ref.watch(classAProvider).getName;
        return Scaffold(
          appBar: AppBar(title: Text("Flutter RiverPod Ex1")),
          body: Center(child: Text("Your name: $_name")),
          floatingActionButton: FloatingActionButton(
            child: Text("Name"),
            onPressed: () {
              ref.read(classAProvider).setName("Nguyen van Toan");
            },
          ),
        );
      },
    );
  }
}

class MyAppRiverpodEx1ConsumerWidget extends ConsumerWidget {
  const MyAppRiverpodEx1ConsumerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lay du lieu tu classA
    String _name = ref.watch(classAProvider).getName;
    return Scaffold(
      appBar: AppBar(title: Text("Flutter RiverPod Ex1")),
      body: Center(child: Text("Your name: $_name")),
      floatingActionButton: FloatingActionButton(
        child: Text("Name"),
        onPressed: () {
          ref.read(classAProvider).setName("Nguyen van Toan");
        },
      ),
    );
  }
}
