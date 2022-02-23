import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/my_class.dart';

class MyAppProviderEx2 extends StatelessWidget {
  const MyAppProviderEx2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context1) {
    return ChangeNotifierProvider<ClassTestAChangeNotifer>(
      create: (context2) => ClassTestAChangeNotifer(),
      child: Consumer<ClassTestAChangeNotifer>(
          builder: (context3, classTestA, child) {
        return Scaffold(
          appBar: AppBar(title: Text(" Provider MyAppProviderEx2")),
          body: Center(
              child: Text(
                  "Your name: ${classTestA.getName} - age ${classTestA.getAge}")),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              classTestA.setName("Nguyen van Toan ${classTestA.getAge}");
              context3.read<ClassTestAChangeNotifer>().setAge =
                  classTestA.getAge + 1;
            },
          ),
        );
      }),
    );
  }
}
