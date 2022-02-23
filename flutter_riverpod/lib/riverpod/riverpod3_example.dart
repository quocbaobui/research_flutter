import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpods/models/my_class.dart';

Provider<ClassTestA> classTestAProvider = Provider<ClassTestA>((ref) {
  return ClassTestA();
});
Provider<ClassTestB> classTestBProvider = Provider<ClassTestB>((ref) {
  ClassTestA _classA = ref.read(classTestAProvider);
  return ClassTestB(_classA);
});

class MyAppRiverpodEx3 extends StatelessWidget {
  const MyAppRiverpodEx3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Riverpod Ex3")),
      body: WidgetB(),
    );
  }
}

class WidgetB extends ConsumerWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String _name = ref.watch(classTestBProvider).myName;
    String _age = ref.watch(classTestAProvider).getAge.toString();
    return Center(child: Text("$_name - Age $_age "));
  }
}
