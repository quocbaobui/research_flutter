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
        ClassTestA _classTestA = ref.watch(classAProvider);
        print("Rebuild MyAppRiverpodEx1Comsumer");
        return Scaffold(
          appBar: AppBar(title: Text("Flutter RiverPod Ex1")),
          body: Center(
              child: Text(
                  "Your name: ${_classTestA.getName} - age ${_classTestA.getAge}")),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              _classTestA.setName("Nguyen van Toan ${_classTestA.getAge}");
              _classTestA.setAge = _classTestA.getAge + 1;
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
    ClassTestA _classTestA = ref.watch(classAProvider);
    print("Rebuild MyAppRiverpodEx1ConsumerWidget");
    return Scaffold(
      appBar: AppBar(title: Text("Flutter RiverPod Ex1")),
      body: Center(
          child: Text(
              "Your name: ${_classTestA.getName} - age ${_classTestA.getAge}")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          ref
              .read(classAProvider)
              .setName("Nguyen van Toan ${_classTestA.getAge}");
          ref.read(classAProvider).setAge = _classTestA.getAge + 1;
        },
      ),
    );
  }
}
