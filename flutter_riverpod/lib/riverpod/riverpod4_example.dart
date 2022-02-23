import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverPod4StateNotifier extends StateNotifier<int> {
  RiverPod4StateNotifier() : super(0);
  void increment() => state++;
}

final counterProvider = StateNotifierProvider<RiverPod4StateNotifier, int>(
    (ref) => RiverPod4StateNotifier());

class RiverPod4Example extends ConsumerWidget {
  const RiverPod4Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Riverpod Ex4")),
      body: Center(child: Text("$counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
