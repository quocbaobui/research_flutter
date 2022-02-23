import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/my_class.dart';

class MyAppProviderEx1 extends StatelessWidget {
  const MyAppProviderEx1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ClassTestA>(
      create: (context) => ClassTestA(),
      child: Consumer<ClassTestA>(builder: (context, classTestA, child) {
        return Scaffold(
          appBar: AppBar(title: Text(" Provider Ex1")),
          body: Center(
              child: Text(
                  "Your name: ${classTestA.getName} - age ${classTestA.getAge}")),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              classTestA.setName("Nguyen van Toan ${classTestA.getAge}");
              classTestA.setAge = classTestA.getAge + 1;
            },
          ),
        );
      }),
    );
  }
}
