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
    ClassTestAChangeNotifer _classTestA =
        ref.watch(classAChangeNotifierProvider);

    ref.listen<ClassTestAChangeNotifer>(classAChangeNotifierProvider,
        (ClassTestAChangeNotifer? previous, ClassTestAChangeNotifer news) {
      print("listen<ClassTestAChangeNotifer> ${news.getName}");

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('${news.getName}'),
      //   duration: const Duration(seconds: 1),
      //   action: SnackBarAction(
      //     label: 'ACTION',
      //     onPressed: () {},
      //   ),
      // ));
    });

    return Scaffold(
      appBar: AppBar(title: Text(" Flutter RiverPod Ex2")),
      body: Center(
          child: Text(
              "Your name: ${_classTestA.getName} - age ${_classTestA.getAge}")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          ref
              .read(classAChangeNotifierProvider)
              .setName("Nguyen van Toan ${_classTestA.getAge}");
          ref.read(classAChangeNotifierProvider).setAge =
              _classTestA.getAge + 1;
        },
      ),
    );
  }
}
